---
title: "Define custom ROS 2 interface"
tags: "ROS 2"
---

# Define custom ROS2 interface
[Detailed Tutorial](https://docs.ros.org/en/galactic/Tutorials/Custom-ROS2-Interfaces.html) 

## 1.Create a new package
The package is for storing new messages, services and action,which could be use in **other** separated packages. Both packages should be in the **same** workspace.

```
ros2 pkg create --build-type ament_cmake <pkg_name>
mkdir msg
mkdir srv
mkdir action
```

## 2.Create custom definitions
### 2.1 msg definition
In the new msg directory, create file `msg_name.msg`, with code declaring its data structure in the form of
```
[type] <msg_name>
[type] <msg_name>
<...>
```

[Message description specification](https://docs.ros.org/en/foxy/Concepts/About-ROS-Interfaces.html#message-description-specification)

### 2.2 srv definitionz
In the new srv directory, create file `srv_name.srv` with the following request and response structure:
```
#request
[type] <name>
[type] <name>
<...>
[type] <name>
---
#response
[type] <name>
<...>
```
### 2.3 action definition
In the new msg directory, create file `act_name.action`, with code declaring its data structure in the form of
```
#request
[type] <name>
[type] <name>
<...>
[type] <name>
---
#result
[type] <name>
<...>
---
#feedback
[type] <msg_name>
<...>
```

## 3.Edit `CMakeLists.txt`
```
find_package(rosidl_default_generators REQUIRED)
rosidl_generate_interfaces(${PROJECT_NAME}
  "msg/<msg_name>.msg"
  "srv/<srv_name>.srv"
  "action/<act_name>.action"
 )

```

## 4.Edit `package.xml`
```
<build_depend>rosidl_default_generators</build_depend>

<exec_depend>rosidl_default_runtime</exec_depend>
<depend>action_msgs</depend>

<member_of_group>rosidl_interface_packages</member_of_group>
```
## 5.Build the pacakge
```
colcon <workspace>
colcon build --packages-select <pkg_name>
```

## 6.Use in other package
In other packages,add import statement at the beginning of python file
```
from <pkg_name>/msg import <msg_name>
from <pkg_name>/srv import <srv_name>
from <pkg_name>/action import <act_name>


```
