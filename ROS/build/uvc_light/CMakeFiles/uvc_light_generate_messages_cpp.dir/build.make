# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/casey/ADR/ROS/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/casey/ADR/ROS/build

# Utility rule file for uvc_light_generate_messages_cpp.

# Include the progress variables for this target.
include uvc_light/CMakeFiles/uvc_light_generate_messages_cpp.dir/progress.make

uvc_light/CMakeFiles/uvc_light_generate_messages_cpp: /home/casey/ADR/ROS/devel/include/uvc_light/set_uvc_light.h


/home/casey/ADR/ROS/devel/include/uvc_light/set_uvc_light.h: /opt/ros/noetic/lib/gencpp/gen_cpp.py
/home/casey/ADR/ROS/devel/include/uvc_light/set_uvc_light.h: /home/casey/ADR/ROS/src/uvc_light/srv/set_uvc_light.srv
/home/casey/ADR/ROS/devel/include/uvc_light/set_uvc_light.h: /opt/ros/noetic/share/gencpp/msg.h.template
/home/casey/ADR/ROS/devel/include/uvc_light/set_uvc_light.h: /opt/ros/noetic/share/gencpp/srv.h.template
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/casey/ADR/ROS/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating C++ code from uvc_light/set_uvc_light.srv"
	cd /home/casey/ADR/ROS/src/uvc_light && /home/casey/ADR/ROS/build/catkin_generated/env_cached.sh /usr/bin/python3 /opt/ros/noetic/share/gencpp/cmake/../../../lib/gencpp/gen_cpp.py /home/casey/ADR/ROS/src/uvc_light/srv/set_uvc_light.srv -Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg -p uvc_light -o /home/casey/ADR/ROS/devel/include/uvc_light -e /opt/ros/noetic/share/gencpp/cmake/..

uvc_light_generate_messages_cpp: uvc_light/CMakeFiles/uvc_light_generate_messages_cpp
uvc_light_generate_messages_cpp: /home/casey/ADR/ROS/devel/include/uvc_light/set_uvc_light.h
uvc_light_generate_messages_cpp: uvc_light/CMakeFiles/uvc_light_generate_messages_cpp.dir/build.make

.PHONY : uvc_light_generate_messages_cpp

# Rule to build all files generated by this target.
uvc_light/CMakeFiles/uvc_light_generate_messages_cpp.dir/build: uvc_light_generate_messages_cpp

.PHONY : uvc_light/CMakeFiles/uvc_light_generate_messages_cpp.dir/build

uvc_light/CMakeFiles/uvc_light_generate_messages_cpp.dir/clean:
	cd /home/casey/ADR/ROS/build/uvc_light && $(CMAKE_COMMAND) -P CMakeFiles/uvc_light_generate_messages_cpp.dir/cmake_clean.cmake
.PHONY : uvc_light/CMakeFiles/uvc_light_generate_messages_cpp.dir/clean

uvc_light/CMakeFiles/uvc_light_generate_messages_cpp.dir/depend:
	cd /home/casey/ADR/ROS/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/casey/ADR/ROS/src /home/casey/ADR/ROS/src/uvc_light /home/casey/ADR/ROS/build /home/casey/ADR/ROS/build/uvc_light /home/casey/ADR/ROS/build/uvc_light/CMakeFiles/uvc_light_generate_messages_cpp.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : uvc_light/CMakeFiles/uvc_light_generate_messages_cpp.dir/depend

