# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "delivery_navigation: 0 messages, 1 services")

set(MSG_I_FLAGS "-Imove_base_msgs:/opt/ros/melodic/share/move_base_msgs/cmake/../msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg;-Iactionlib_msgs:/opt/ros/melodic/share/actionlib_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/melodic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(delivery_navigation_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/wheeltec/wheeltec_robot/src/delivery_navigation/srv/ClientPose.srv" NAME_WE)
add_custom_target(_delivery_navigation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "delivery_navigation" "/home/wheeltec/wheeltec_robot/src/delivery_navigation/srv/ClientPose.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(delivery_navigation
  "/home/wheeltec/wheeltec_robot/src/delivery_navigation/srv/ClientPose.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/delivery_navigation
)

### Generating Module File
_generate_module_cpp(delivery_navigation
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/delivery_navigation
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(delivery_navigation_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(delivery_navigation_generate_messages delivery_navigation_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/wheeltec/wheeltec_robot/src/delivery_navigation/srv/ClientPose.srv" NAME_WE)
add_dependencies(delivery_navigation_generate_messages_cpp _delivery_navigation_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(delivery_navigation_gencpp)
add_dependencies(delivery_navigation_gencpp delivery_navigation_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS delivery_navigation_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(delivery_navigation
  "/home/wheeltec/wheeltec_robot/src/delivery_navigation/srv/ClientPose.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/delivery_navigation
)

### Generating Module File
_generate_module_eus(delivery_navigation
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/delivery_navigation
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(delivery_navigation_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(delivery_navigation_generate_messages delivery_navigation_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/wheeltec/wheeltec_robot/src/delivery_navigation/srv/ClientPose.srv" NAME_WE)
add_dependencies(delivery_navigation_generate_messages_eus _delivery_navigation_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(delivery_navigation_geneus)
add_dependencies(delivery_navigation_geneus delivery_navigation_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS delivery_navigation_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(delivery_navigation
  "/home/wheeltec/wheeltec_robot/src/delivery_navigation/srv/ClientPose.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/delivery_navigation
)

### Generating Module File
_generate_module_lisp(delivery_navigation
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/delivery_navigation
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(delivery_navigation_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(delivery_navigation_generate_messages delivery_navigation_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/wheeltec/wheeltec_robot/src/delivery_navigation/srv/ClientPose.srv" NAME_WE)
add_dependencies(delivery_navigation_generate_messages_lisp _delivery_navigation_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(delivery_navigation_genlisp)
add_dependencies(delivery_navigation_genlisp delivery_navigation_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS delivery_navigation_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services
_generate_srv_nodejs(delivery_navigation
  "/home/wheeltec/wheeltec_robot/src/delivery_navigation/srv/ClientPose.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/delivery_navigation
)

### Generating Module File
_generate_module_nodejs(delivery_navigation
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/delivery_navigation
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(delivery_navigation_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(delivery_navigation_generate_messages delivery_navigation_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/wheeltec/wheeltec_robot/src/delivery_navigation/srv/ClientPose.srv" NAME_WE)
add_dependencies(delivery_navigation_generate_messages_nodejs _delivery_navigation_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(delivery_navigation_gennodejs)
add_dependencies(delivery_navigation_gennodejs delivery_navigation_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS delivery_navigation_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(delivery_navigation
  "/home/wheeltec/wheeltec_robot/src/delivery_navigation/srv/ClientPose.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/delivery_navigation
)

### Generating Module File
_generate_module_py(delivery_navigation
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/delivery_navigation
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(delivery_navigation_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(delivery_navigation_generate_messages delivery_navigation_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/wheeltec/wheeltec_robot/src/delivery_navigation/srv/ClientPose.srv" NAME_WE)
add_dependencies(delivery_navigation_generate_messages_py _delivery_navigation_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(delivery_navigation_genpy)
add_dependencies(delivery_navigation_genpy delivery_navigation_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS delivery_navigation_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/delivery_navigation)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/delivery_navigation
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET move_base_msgs_generate_messages_cpp)
  add_dependencies(delivery_navigation_generate_messages_cpp move_base_msgs_generate_messages_cpp)
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(delivery_navigation_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/delivery_navigation)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/delivery_navigation
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET move_base_msgs_generate_messages_eus)
  add_dependencies(delivery_navigation_generate_messages_eus move_base_msgs_generate_messages_eus)
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(delivery_navigation_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/delivery_navigation)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/delivery_navigation
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET move_base_msgs_generate_messages_lisp)
  add_dependencies(delivery_navigation_generate_messages_lisp move_base_msgs_generate_messages_lisp)
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(delivery_navigation_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/delivery_navigation)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/delivery_navigation
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET move_base_msgs_generate_messages_nodejs)
  add_dependencies(delivery_navigation_generate_messages_nodejs move_base_msgs_generate_messages_nodejs)
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(delivery_navigation_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/delivery_navigation)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/delivery_navigation\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/delivery_navigation
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET move_base_msgs_generate_messages_py)
  add_dependencies(delivery_navigation_generate_messages_py move_base_msgs_generate_messages_py)
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(delivery_navigation_generate_messages_py std_msgs_generate_messages_py)
endif()
