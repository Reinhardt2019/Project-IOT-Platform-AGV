# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

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
CMAKE_SOURCE_DIR = /home/wheeltec/wheeltec_robot/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/wheeltec/wheeltec_robot/build

# Include any dependencies generated for this target.
include navigation-melodic/base_local_planner/CMakeFiles/trajectory_planner_ros.dir/depend.make

# Include the progress variables for this target.
include navigation-melodic/base_local_planner/CMakeFiles/trajectory_planner_ros.dir/progress.make

# Include the compile flags for this target's objects.
include navigation-melodic/base_local_planner/CMakeFiles/trajectory_planner_ros.dir/flags.make

navigation-melodic/base_local_planner/CMakeFiles/trajectory_planner_ros.dir/src/trajectory_planner.cpp.o: navigation-melodic/base_local_planner/CMakeFiles/trajectory_planner_ros.dir/flags.make
navigation-melodic/base_local_planner/CMakeFiles/trajectory_planner_ros.dir/src/trajectory_planner.cpp.o: /home/wheeltec/wheeltec_robot/src/navigation-melodic/base_local_planner/src/trajectory_planner.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wheeltec/wheeltec_robot/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object navigation-melodic/base_local_planner/CMakeFiles/trajectory_planner_ros.dir/src/trajectory_planner.cpp.o"
	cd /home/wheeltec/wheeltec_robot/build/navigation-melodic/base_local_planner && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/trajectory_planner_ros.dir/src/trajectory_planner.cpp.o -c /home/wheeltec/wheeltec_robot/src/navigation-melodic/base_local_planner/src/trajectory_planner.cpp

navigation-melodic/base_local_planner/CMakeFiles/trajectory_planner_ros.dir/src/trajectory_planner.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/trajectory_planner_ros.dir/src/trajectory_planner.cpp.i"
	cd /home/wheeltec/wheeltec_robot/build/navigation-melodic/base_local_planner && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/wheeltec/wheeltec_robot/src/navigation-melodic/base_local_planner/src/trajectory_planner.cpp > CMakeFiles/trajectory_planner_ros.dir/src/trajectory_planner.cpp.i

navigation-melodic/base_local_planner/CMakeFiles/trajectory_planner_ros.dir/src/trajectory_planner.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/trajectory_planner_ros.dir/src/trajectory_planner.cpp.s"
	cd /home/wheeltec/wheeltec_robot/build/navigation-melodic/base_local_planner && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/wheeltec/wheeltec_robot/src/navigation-melodic/base_local_planner/src/trajectory_planner.cpp -o CMakeFiles/trajectory_planner_ros.dir/src/trajectory_planner.cpp.s

navigation-melodic/base_local_planner/CMakeFiles/trajectory_planner_ros.dir/src/trajectory_planner.cpp.o.requires:

.PHONY : navigation-melodic/base_local_planner/CMakeFiles/trajectory_planner_ros.dir/src/trajectory_planner.cpp.o.requires

navigation-melodic/base_local_planner/CMakeFiles/trajectory_planner_ros.dir/src/trajectory_planner.cpp.o.provides: navigation-melodic/base_local_planner/CMakeFiles/trajectory_planner_ros.dir/src/trajectory_planner.cpp.o.requires
	$(MAKE) -f navigation-melodic/base_local_planner/CMakeFiles/trajectory_planner_ros.dir/build.make navigation-melodic/base_local_planner/CMakeFiles/trajectory_planner_ros.dir/src/trajectory_planner.cpp.o.provides.build
.PHONY : navigation-melodic/base_local_planner/CMakeFiles/trajectory_planner_ros.dir/src/trajectory_planner.cpp.o.provides

navigation-melodic/base_local_planner/CMakeFiles/trajectory_planner_ros.dir/src/trajectory_planner.cpp.o.provides.build: navigation-melodic/base_local_planner/CMakeFiles/trajectory_planner_ros.dir/src/trajectory_planner.cpp.o


navigation-melodic/base_local_planner/CMakeFiles/trajectory_planner_ros.dir/src/trajectory_planner_ros.cpp.o: navigation-melodic/base_local_planner/CMakeFiles/trajectory_planner_ros.dir/flags.make
navigation-melodic/base_local_planner/CMakeFiles/trajectory_planner_ros.dir/src/trajectory_planner_ros.cpp.o: /home/wheeltec/wheeltec_robot/src/navigation-melodic/base_local_planner/src/trajectory_planner_ros.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wheeltec/wheeltec_robot/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object navigation-melodic/base_local_planner/CMakeFiles/trajectory_planner_ros.dir/src/trajectory_planner_ros.cpp.o"
	cd /home/wheeltec/wheeltec_robot/build/navigation-melodic/base_local_planner && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/trajectory_planner_ros.dir/src/trajectory_planner_ros.cpp.o -c /home/wheeltec/wheeltec_robot/src/navigation-melodic/base_local_planner/src/trajectory_planner_ros.cpp

navigation-melodic/base_local_planner/CMakeFiles/trajectory_planner_ros.dir/src/trajectory_planner_ros.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/trajectory_planner_ros.dir/src/trajectory_planner_ros.cpp.i"
	cd /home/wheeltec/wheeltec_robot/build/navigation-melodic/base_local_planner && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/wheeltec/wheeltec_robot/src/navigation-melodic/base_local_planner/src/trajectory_planner_ros.cpp > CMakeFiles/trajectory_planner_ros.dir/src/trajectory_planner_ros.cpp.i

navigation-melodic/base_local_planner/CMakeFiles/trajectory_planner_ros.dir/src/trajectory_planner_ros.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/trajectory_planner_ros.dir/src/trajectory_planner_ros.cpp.s"
	cd /home/wheeltec/wheeltec_robot/build/navigation-melodic/base_local_planner && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/wheeltec/wheeltec_robot/src/navigation-melodic/base_local_planner/src/trajectory_planner_ros.cpp -o CMakeFiles/trajectory_planner_ros.dir/src/trajectory_planner_ros.cpp.s

navigation-melodic/base_local_planner/CMakeFiles/trajectory_planner_ros.dir/src/trajectory_planner_ros.cpp.o.requires:

.PHONY : navigation-melodic/base_local_planner/CMakeFiles/trajectory_planner_ros.dir/src/trajectory_planner_ros.cpp.o.requires

navigation-melodic/base_local_planner/CMakeFiles/trajectory_planner_ros.dir/src/trajectory_planner_ros.cpp.o.provides: navigation-melodic/base_local_planner/CMakeFiles/trajectory_planner_ros.dir/src/trajectory_planner_ros.cpp.o.requires
	$(MAKE) -f navigation-melodic/base_local_planner/CMakeFiles/trajectory_planner_ros.dir/build.make navigation-melodic/base_local_planner/CMakeFiles/trajectory_planner_ros.dir/src/trajectory_planner_ros.cpp.o.provides.build
.PHONY : navigation-melodic/base_local_planner/CMakeFiles/trajectory_planner_ros.dir/src/trajectory_planner_ros.cpp.o.provides

navigation-melodic/base_local_planner/CMakeFiles/trajectory_planner_ros.dir/src/trajectory_planner_ros.cpp.o.provides.build: navigation-melodic/base_local_planner/CMakeFiles/trajectory_planner_ros.dir/src/trajectory_planner_ros.cpp.o


# Object files for target trajectory_planner_ros
trajectory_planner_ros_OBJECTS = \
"CMakeFiles/trajectory_planner_ros.dir/src/trajectory_planner.cpp.o" \
"CMakeFiles/trajectory_planner_ros.dir/src/trajectory_planner_ros.cpp.o"

# External object files for target trajectory_planner_ros
trajectory_planner_ros_EXTERNAL_OBJECTS =

/home/wheeltec/wheeltec_robot/devel/lib/libtrajectory_planner_ros.so: navigation-melodic/base_local_planner/CMakeFiles/trajectory_planner_ros.dir/src/trajectory_planner.cpp.o
/home/wheeltec/wheeltec_robot/devel/lib/libtrajectory_planner_ros.so: navigation-melodic/base_local_planner/CMakeFiles/trajectory_planner_ros.dir/src/trajectory_planner_ros.cpp.o
/home/wheeltec/wheeltec_robot/devel/lib/libtrajectory_planner_ros.so: navigation-melodic/base_local_planner/CMakeFiles/trajectory_planner_ros.dir/build.make
/home/wheeltec/wheeltec_robot/devel/lib/libtrajectory_planner_ros.so: /home/wheeltec/wheeltec_robot/devel/lib/libbase_local_planner.so
/home/wheeltec/wheeltec_robot/devel/lib/libtrajectory_planner_ros.so: /home/wheeltec/wheeltec_robot/devel/lib/liblayers.so
/home/wheeltec/wheeltec_robot/devel/lib/libtrajectory_planner_ros.so: /home/wheeltec/wheeltec_robot/devel/lib/libcostmap_2d.so
/home/wheeltec/wheeltec_robot/devel/lib/libtrajectory_planner_ros.so: /opt/ros/melodic/lib/libdynamic_reconfigure_config_init_mutex.so
/home/wheeltec/wheeltec_robot/devel/lib/libtrajectory_planner_ros.so: /opt/ros/melodic/lib/liblaser_geometry.so
/home/wheeltec/wheeltec_robot/devel/lib/libtrajectory_planner_ros.so: /opt/ros/melodic/lib/libtf.so
/home/wheeltec/wheeltec_robot/devel/lib/libtrajectory_planner_ros.so: /opt/ros/melodic/lib/libclass_loader.so
/home/wheeltec/wheeltec_robot/devel/lib/libtrajectory_planner_ros.so: /usr/lib/libPocoFoundation.so
/home/wheeltec/wheeltec_robot/devel/lib/libtrajectory_planner_ros.so: /usr/lib/aarch64-linux-gnu/libdl.so
/home/wheeltec/wheeltec_robot/devel/lib/libtrajectory_planner_ros.so: /opt/ros/melodic/lib/libroslib.so
/home/wheeltec/wheeltec_robot/devel/lib/libtrajectory_planner_ros.so: /opt/ros/melodic/lib/librospack.so
/home/wheeltec/wheeltec_robot/devel/lib/libtrajectory_planner_ros.so: /usr/lib/aarch64-linux-gnu/libpython2.7.so
/home/wheeltec/wheeltec_robot/devel/lib/libtrajectory_planner_ros.so: /usr/lib/aarch64-linux-gnu/libboost_program_options.so
/home/wheeltec/wheeltec_robot/devel/lib/libtrajectory_planner_ros.so: /usr/lib/aarch64-linux-gnu/libtinyxml2.so
/home/wheeltec/wheeltec_robot/devel/lib/libtrajectory_planner_ros.so: /opt/ros/melodic/lib/liborocos-kdl.so
/home/wheeltec/wheeltec_robot/devel/lib/libtrajectory_planner_ros.so: /opt/ros/melodic/lib/liborocos-kdl.so.1.4.0
/home/wheeltec/wheeltec_robot/devel/lib/libtrajectory_planner_ros.so: /opt/ros/melodic/lib/libtf2_ros.so
/home/wheeltec/wheeltec_robot/devel/lib/libtrajectory_planner_ros.so: /opt/ros/melodic/lib/libactionlib.so
/home/wheeltec/wheeltec_robot/devel/lib/libtrajectory_planner_ros.so: /opt/ros/melodic/lib/libmessage_filters.so
/home/wheeltec/wheeltec_robot/devel/lib/libtrajectory_planner_ros.so: /opt/ros/melodic/lib/libtf2.so
/home/wheeltec/wheeltec_robot/devel/lib/libtrajectory_planner_ros.so: /home/wheeltec/wheeltec_robot/devel/lib/libvoxel_grid.so
/home/wheeltec/wheeltec_robot/devel/lib/libtrajectory_planner_ros.so: /opt/ros/melodic/lib/libroscpp.so
/home/wheeltec/wheeltec_robot/devel/lib/libtrajectory_planner_ros.so: /usr/lib/aarch64-linux-gnu/libboost_filesystem.so
/home/wheeltec/wheeltec_robot/devel/lib/libtrajectory_planner_ros.so: /opt/ros/melodic/lib/librosconsole.so
/home/wheeltec/wheeltec_robot/devel/lib/libtrajectory_planner_ros.so: /opt/ros/melodic/lib/librosconsole_log4cxx.so
/home/wheeltec/wheeltec_robot/devel/lib/libtrajectory_planner_ros.so: /opt/ros/melodic/lib/librosconsole_backend_interface.so
/home/wheeltec/wheeltec_robot/devel/lib/libtrajectory_planner_ros.so: /usr/lib/aarch64-linux-gnu/liblog4cxx.so
/home/wheeltec/wheeltec_robot/devel/lib/libtrajectory_planner_ros.so: /usr/lib/aarch64-linux-gnu/libboost_regex.so
/home/wheeltec/wheeltec_robot/devel/lib/libtrajectory_planner_ros.so: /opt/ros/melodic/lib/libroscpp_serialization.so
/home/wheeltec/wheeltec_robot/devel/lib/libtrajectory_planner_ros.so: /opt/ros/melodic/lib/libxmlrpcpp.so
/home/wheeltec/wheeltec_robot/devel/lib/libtrajectory_planner_ros.so: /opt/ros/melodic/lib/librostime.so
/home/wheeltec/wheeltec_robot/devel/lib/libtrajectory_planner_ros.so: /opt/ros/melodic/lib/libcpp_common.so
/home/wheeltec/wheeltec_robot/devel/lib/libtrajectory_planner_ros.so: /usr/lib/aarch64-linux-gnu/libboost_system.so
/home/wheeltec/wheeltec_robot/devel/lib/libtrajectory_planner_ros.so: /usr/lib/aarch64-linux-gnu/libboost_thread.so
/home/wheeltec/wheeltec_robot/devel/lib/libtrajectory_planner_ros.so: /usr/lib/aarch64-linux-gnu/libboost_chrono.so
/home/wheeltec/wheeltec_robot/devel/lib/libtrajectory_planner_ros.so: /usr/lib/aarch64-linux-gnu/libboost_date_time.so
/home/wheeltec/wheeltec_robot/devel/lib/libtrajectory_planner_ros.so: /usr/lib/aarch64-linux-gnu/libboost_atomic.so
/home/wheeltec/wheeltec_robot/devel/lib/libtrajectory_planner_ros.so: /usr/lib/aarch64-linux-gnu/libpthread.so
/home/wheeltec/wheeltec_robot/devel/lib/libtrajectory_planner_ros.so: /usr/lib/aarch64-linux-gnu/libconsole_bridge.so.0.4
/home/wheeltec/wheeltec_robot/devel/lib/libtrajectory_planner_ros.so: navigation-melodic/base_local_planner/CMakeFiles/trajectory_planner_ros.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/wheeltec/wheeltec_robot/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX shared library /home/wheeltec/wheeltec_robot/devel/lib/libtrajectory_planner_ros.so"
	cd /home/wheeltec/wheeltec_robot/build/navigation-melodic/base_local_planner && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/trajectory_planner_ros.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
navigation-melodic/base_local_planner/CMakeFiles/trajectory_planner_ros.dir/build: /home/wheeltec/wheeltec_robot/devel/lib/libtrajectory_planner_ros.so

.PHONY : navigation-melodic/base_local_planner/CMakeFiles/trajectory_planner_ros.dir/build

navigation-melodic/base_local_planner/CMakeFiles/trajectory_planner_ros.dir/requires: navigation-melodic/base_local_planner/CMakeFiles/trajectory_planner_ros.dir/src/trajectory_planner.cpp.o.requires
navigation-melodic/base_local_planner/CMakeFiles/trajectory_planner_ros.dir/requires: navigation-melodic/base_local_planner/CMakeFiles/trajectory_planner_ros.dir/src/trajectory_planner_ros.cpp.o.requires

.PHONY : navigation-melodic/base_local_planner/CMakeFiles/trajectory_planner_ros.dir/requires

navigation-melodic/base_local_planner/CMakeFiles/trajectory_planner_ros.dir/clean:
	cd /home/wheeltec/wheeltec_robot/build/navigation-melodic/base_local_planner && $(CMAKE_COMMAND) -P CMakeFiles/trajectory_planner_ros.dir/cmake_clean.cmake
.PHONY : navigation-melodic/base_local_planner/CMakeFiles/trajectory_planner_ros.dir/clean

navigation-melodic/base_local_planner/CMakeFiles/trajectory_planner_ros.dir/depend:
	cd /home/wheeltec/wheeltec_robot/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/wheeltec/wheeltec_robot/src /home/wheeltec/wheeltec_robot/src/navigation-melodic/base_local_planner /home/wheeltec/wheeltec_robot/build /home/wheeltec/wheeltec_robot/build/navigation-melodic/base_local_planner /home/wheeltec/wheeltec_robot/build/navigation-melodic/base_local_planner/CMakeFiles/trajectory_planner_ros.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : navigation-melodic/base_local_planner/CMakeFiles/trajectory_planner_ros.dir/depend

