# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "wheeltec_multi: 1 messages, 0 services")

set(MSG_I_FLAGS "-Iwheeltec_multi:/home/wheeltec/wheeltec_robot/src/wheeltec_multi/msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/melodic/share/sensor_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/melodic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(wheeltec_multi_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/wheeltec/wheeltec_robot/src/wheeltec_multi/msg/avoid.msg" NAME_WE)
add_custom_target(_wheeltec_multi_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wheeltec_multi" "/home/wheeltec/wheeltec_robot/src/wheeltec_multi/msg/avoid.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(wheeltec_multi
  "/home/wheeltec/wheeltec_robot/src/wheeltec_multi/msg/avoid.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wheeltec_multi
)

### Generating Services

### Generating Module File
_generate_module_cpp(wheeltec_multi
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wheeltec_multi
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(wheeltec_multi_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(wheeltec_multi_generate_messages wheeltec_multi_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/wheeltec/wheeltec_robot/src/wheeltec_multi/msg/avoid.msg" NAME_WE)
add_dependencies(wheeltec_multi_generate_messages_cpp _wheeltec_multi_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(wheeltec_multi_gencpp)
add_dependencies(wheeltec_multi_gencpp wheeltec_multi_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS wheeltec_multi_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(wheeltec_multi
  "/home/wheeltec/wheeltec_robot/src/wheeltec_multi/msg/avoid.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/wheeltec_multi
)

### Generating Services

### Generating Module File
_generate_module_eus(wheeltec_multi
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/wheeltec_multi
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(wheeltec_multi_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(wheeltec_multi_generate_messages wheeltec_multi_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/wheeltec/wheeltec_robot/src/wheeltec_multi/msg/avoid.msg" NAME_WE)
add_dependencies(wheeltec_multi_generate_messages_eus _wheeltec_multi_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(wheeltec_multi_geneus)
add_dependencies(wheeltec_multi_geneus wheeltec_multi_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS wheeltec_multi_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(wheeltec_multi
  "/home/wheeltec/wheeltec_robot/src/wheeltec_multi/msg/avoid.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wheeltec_multi
)

### Generating Services

### Generating Module File
_generate_module_lisp(wheeltec_multi
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wheeltec_multi
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(wheeltec_multi_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(wheeltec_multi_generate_messages wheeltec_multi_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/wheeltec/wheeltec_robot/src/wheeltec_multi/msg/avoid.msg" NAME_WE)
add_dependencies(wheeltec_multi_generate_messages_lisp _wheeltec_multi_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(wheeltec_multi_genlisp)
add_dependencies(wheeltec_multi_genlisp wheeltec_multi_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS wheeltec_multi_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(wheeltec_multi
  "/home/wheeltec/wheeltec_robot/src/wheeltec_multi/msg/avoid.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/wheeltec_multi
)

### Generating Services

### Generating Module File
_generate_module_nodejs(wheeltec_multi
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/wheeltec_multi
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(wheeltec_multi_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(wheeltec_multi_generate_messages wheeltec_multi_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/wheeltec/wheeltec_robot/src/wheeltec_multi/msg/avoid.msg" NAME_WE)
add_dependencies(wheeltec_multi_generate_messages_nodejs _wheeltec_multi_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(wheeltec_multi_gennodejs)
add_dependencies(wheeltec_multi_gennodejs wheeltec_multi_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS wheeltec_multi_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(wheeltec_multi
  "/home/wheeltec/wheeltec_robot/src/wheeltec_multi/msg/avoid.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wheeltec_multi
)

### Generating Services

### Generating Module File
_generate_module_py(wheeltec_multi
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wheeltec_multi
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(wheeltec_multi_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(wheeltec_multi_generate_messages wheeltec_multi_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/wheeltec/wheeltec_robot/src/wheeltec_multi/msg/avoid.msg" NAME_WE)
add_dependencies(wheeltec_multi_generate_messages_py _wheeltec_multi_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(wheeltec_multi_genpy)
add_dependencies(wheeltec_multi_genpy wheeltec_multi_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS wheeltec_multi_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wheeltec_multi)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wheeltec_multi
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(wheeltec_multi_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(wheeltec_multi_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(wheeltec_multi_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/wheeltec_multi)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/wheeltec_multi
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(wheeltec_multi_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(wheeltec_multi_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(wheeltec_multi_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wheeltec_multi)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wheeltec_multi
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(wheeltec_multi_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(wheeltec_multi_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(wheeltec_multi_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/wheeltec_multi)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/wheeltec_multi
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(wheeltec_multi_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(wheeltec_multi_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(wheeltec_multi_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wheeltec_multi)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wheeltec_multi\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wheeltec_multi
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(wheeltec_multi_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(wheeltec_multi_generate_messages_py sensor_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(wheeltec_multi_generate_messages_py geometry_msgs_generate_messages_py)
endif()
