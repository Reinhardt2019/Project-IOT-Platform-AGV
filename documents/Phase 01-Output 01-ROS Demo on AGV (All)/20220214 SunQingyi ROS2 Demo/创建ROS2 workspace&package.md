---
title: "Build ROS 2 workspace&pakcage"
tags: "ROS 2"
---

# ROS2 workspace
[Detailed Tutorial](https://docs.ros.org/en/galactic/Tutorials/Workspace/Creating-A-Workspace.html)
## Check missing dependency
run `rosdep` in the root of the workspace to check missing dependencies.
```
rosdep install -i --from-path src --rosdistro galactic -y
```
## create workspace
```
source /opt/ros/galactic/setup.bash #source ROS 2 enviroment
mkdir -p ~/dev_ws/src #create workspace directory
cd ~/dev_ws/src
```

## clone existing package 
```
git clone <package_url>
```

# ROS2 Python package
[Detailed Tutorial](https://docs.ros.org/en/galactic/Tutorials/Creating-Your-First-ROS2-Package.html)
## Required contents

- `pakage.xml`file containing** meta information **about the package
- `setup.py` containing **instructions** for how to **install** the package
- `setup.cfg` is required when a package has **executables**, so ros2 run can find them
- `/<package_name>` - a directory with the **same** name as your package, used by ROS 2 tools to find your package, contains __init__.py


## Build a package

```
cd ~/dev_ws/src
ros2 pkg create --build-type ament_python <package_name> (--dependencies <depende_name>)
# the dependencies argument is optional
#it will automatically add the dependency lines to package.xml and CMakeLists.txt
cd ~/dev_ws
colcon build --packages-select <package_name>
. install/local_setup.bash
ros2 run <package_name> <node_name>
```

## Package description
The following information in `package.xml` might need to be edited:
```
 <description>TODO: Package description</description>
 <maintainer email="email@siemens.com">user</maintainer>
 <license>TODO: License declaration</license>
```
To add dependencies: `<exec_depend>depend_pkg_name</exec_depend>`

The following information in `setup.py` might need to be edited:
```
 maintainer='Name',
 maintainer_email='email@siemens.com',
 description='TODO: Package description',
 license='TODO: License declaration',
 tests_require=['pytest'],
 entry_points={
     'console_scripts': [
             'node_name = pkg_name.node_name:main'
     ],
```
