#include "serial_command_client_node.hpp"

SerialCommandClientNode::SerialCommandClientNode(ros::NodeHandle const &node_handle) : m_node_handle(node_handle)
{
    std::string path_name;

    if (!m_node_handle.getParam("path_name", path_name)) {
        throw std::runtime_error("path_name not provided");
    }

    m_serial_command_client.open(path_name);
    
    m_send_command_server = m_node_handle.advertiseService(path_name + "/send_command", &SerialCommandClientNode::onSendCommand, this);
}

SerialCommandClientNode::~SerialCommandClientNode()
{
    m_serial_command_client.close();
}

bool SerialCommandClientNode::onSendCommand(serial_command_client::send_command::Request &request, serial_command_client::send_command::Response &response)
{
    SerialCommandRequest serial_command_request;

    serial_command_request.command = request.command;

    serial_command_request.size = request.buffer.size();

    std::memcpy(&serial_command_request.buffer[0], request.buffer.data(), request.buffer.size());

    SerialCommandResponse serial_command_response;

    m_serial_command_client.sendCommand(serial_command_request, serial_command_response);

    response.status = serial_command_response.status;

    response.buffer.resize(serial_command_response.size);
    
    std::memcpy(response.buffer.data(), &serial_command_response.buffer[0], serial_command_response.size);

    return true;
}

int main(int argc, char **argv)
{
    try {
        ros::init(argc, argv, "serial_command_client");

        ros::NodeHandle node_handle("~");

        SerialCommandClientNode serial_command_client_node(node_handle);
        
        while (ros::ok()) {
            ros::spinOnce();
        }

        return 0;
    }
    catch (std::exception const &exception) {
        ROS_ERROR("%s", exception.what());

        return 1;
    }
}