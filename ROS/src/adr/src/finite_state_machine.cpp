#include "finite_state_machine.hpp"

Context::Context(ros::NodeHandle const &node_handle) : m_node_handle(node_handle)
{
}

void Idle::enter(Control &control) noexcept 
{
    ROS_INFO("Idle state entered.");
}

void Idle::update(FullControl &control) noexcept 
{
}

void Idle::exit(Control &control) noexcept
{
    ROS_INFO("Idle state exited.");
}

void Manual::enter(Control &control) noexcept 
{
    ROS_INFO("Manual state entered.");
}

void Manual::update(FullControl &control) noexcept 
{
}

void Manual::exit(Control &control) noexcept
{
    ROS_INFO("Manual state exited.");
}

void Automatic::entryGuard(GuardControl &control) noexcept 
{    
    try {
        m_realsense_pid = m_ros_launch_manager.start(
            "realsense2_camera", "rs_camera.launch",
            "align_depth:=true");

        m_rtabmap_pid = m_ros_launch_manager.start(
            "rtabmap_ros", "rtabmap.launch", 
            "rtabmap_args:=\"--delete_db_on_start\"", 
            "depth_topic:=/camera/aligned_depth_to_color/image_raw", 
            "rgb_topic:=/camera/color/image_raw",
            "camera_info_topic:=/camera/color/camera_info",
            "approx_sync:=false");
    }
    catch (std::exception const &exception) {
        ROS_WARN("%s", exception.what());

        control.changeTo<Idle>();
    }
}

void Automatic::enter(Control &control) noexcept
{
    ROS_INFO("Automatic state entered.");
}

void Automatic::update(FullControl &control) noexcept 
{
}

void Automatic::exitGuard(GuardControl &control) noexcept
{
    try {
        m_ros_launch_manager.stop(m_rtabmap_pid, SIGINT);
        m_ros_launch_manager.stop(m_realsense_pid, SIGINT);
    }
    catch (std::exception const &exception) {
        ROS_WARN("%s", exception.what());

        control.changeTo<Idle>();
    }
}

void Automatic::exit(Control &control) noexcept
{
    ROS_INFO("Automatic state exited.");
}

void Delay::enter(Control &control) noexcept 
{
    ROS_INFO("Delay state entered.");
    
    m_start = ros::Time::now();
    m_delay = ros::Duration(10.0);
}

void Delay::update(FullControl &control) noexcept 
{
    if (ros::Time::now() > m_start + m_delay) {
        control.changeTo<Discover>();
    }
}

void Delay::exit(Control &control) noexcept
{
    ROS_INFO("Delay state exited.");
}

void Discover::entryGuard(GuardControl &control) noexcept 
{
    m_set_mode_mapping_client = control.context().m_node_handle.serviceClient<std_srvs::Empty>("/rtabmap/set_mode_mapping");

    std_srvs::Empty empty_srv;

    if (!m_set_mode_mapping_client.call(empty_srv)) {
        ROS_WARN("Failed to set RTABMAP mode to mapping.");

        control.changeTo<Idle>();
    }
}

void Discover::enter(Control &control) noexcept
{
    ROS_INFO("Discover state entered.");
}

void Discover::update(FullControl &control) noexcept 
{
}

void Discover::exit(Control &control) noexcept
{
    ROS_INFO("Discover state exited.");
}

void Observe::enter(Control &control) noexcept 
{
    ROS_INFO("Observe state entered.");
}

void Observe::update(FullControl &control) noexcept 
{
    control.changeTo<Explore>();
}

void Observe::exit(Control &control) noexcept
{
    ROS_INFO("Observe state exited.");
}

void Explore::enter(Control &control) noexcept 
{
    ROS_INFO("Explore state entered.");
}

void Explore::update(FullControl &control) noexcept 
{
    control.changeTo<Disinfect>();
}

void Explore::exit(Control &control) noexcept
{
    ROS_INFO("Explore state exited.");
}

void Disinfect::entryGuard(GuardControl &control) noexcept 
{
    m_set_mode_localization_client = control.context().m_node_handle.serviceClient<std_srvs::Empty>("/rtabmap/set_mode_localization");
    m_set_uvc_light_client = control.context().m_node_handle.serviceClient<uvc_light::set_uvc_light>("/dev/ttyUSB0/set_uvc_light");
    m_make_plan_client = control.context().m_node_handle.serviceClient<uvc_light::set_uvc_light>("/adr/make_plan");

    std_srvs::Empty set_mode_localization_srv;

    if (m_set_mode_localization_client.call(set_mode_localization_srv)) {
        uvc_light::set_uvc_light set_uvc_light_srv;

        set_uvc_light_srv.request.state = true;

        if (m_set_uvc_light_client.call(set_uvc_light_srv)) {
            coverage_path_planner::make_plan make_plan_srv;

            if (m_make_plan_client.call(make_plan_srv)) {
                m_plan = make_plan_srv.response.plan;

                m_move_base_client = std::make_unique<actionlib::SimpleActionClient<move_base_msgs::MoveBaseAction>>("move_base", true);

                if (m_move_base_client->waitForServer(ros::Duration(10.0))) {
                    if (!sendNextGoal(true)) {
                        ROS_WARN("Plan is empty.");

                        control.changeTo<Idle>();
                    }
                }
                else {
                    ROS_WARN("Failed to load move_base action client.");

                    control.changeTo<Idle>();
                }
            }
            else {
                ROS_WARN("Failed to make a plan.");

                control.changeTo<Idle>();
            }
        }
        else {
            ROS_WARN("Failed to turn UVC light on.");

            control.changeTo<Idle>();
        }
    }
    else {
        ROS_WARN("Failed to set RTABMAP mode to localization.");

        control.changeTo<Idle>();
    }
}

void Disinfect::enter(Control &control) noexcept
{
    ROS_INFO("Disinfect state entered.");
}

void Disinfect::update(FullControl &control) noexcept 
{
    if(m_move_base_client->getState() == actionlib::SimpleClientGoalState::SUCCEEDED) {
        if (!sendNextGoal(false)) {
            control.changeTo<Idle>();
        }
    }
    else if (m_move_base_client->getState() == actionlib::SimpleClientGoalState::ABORTED) {
        ROS_WARN("Navigation aborted.");

        control.changeTo<Idle>();
    }
}

void Disinfect::exitGuard(GuardControl &control) noexcept
{
    uvc_light::set_uvc_light set_uvc_light_srv;

    set_uvc_light_srv.request.state = false;

    if (!m_set_uvc_light_client.call(set_uvc_light_srv)) {
        ROS_WARN("Failed to turn UVC light off.");

        control.changeTo<Idle>();
    }
}

void Disinfect::exit(Control &control) noexcept
{
    ROS_INFO("Disinfect state exited.");
}

bool Disinfect::sendNextGoal(bool const initial)
{
    if (initial) {
        m_plan_iterator = std::cbegin(m_plan);
    }
    else {
        m_plan_iterator = std::next(m_plan_iterator);
    }

    if (m_plan_iterator == std::cend(m_plan)) {
        return false;
    }
    else {
        ROS_INFO("Navigating to waypoint %zu of %zu.", std::distance(std::cbegin(m_plan), m_plan_iterator) + 1, std::size(m_plan));

        move_base_msgs::MoveBaseGoal goal;

        goal.target_pose.header.frame_id = "base_link";
        goal.target_pose.header.stamp = ros::Time::now();

        goal.target_pose.pose = *m_plan_iterator;

        m_move_base_client->sendGoal(goal);

        return true;
    }
}