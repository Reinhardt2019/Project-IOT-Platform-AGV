---
title: "ROS 2 Installation and Configuration for Linux"
tags: ""
---

# ROS 2 Installation

## [Ubuntu Linux](https://docs.ros.org/en/galactic/Installation/Ubuntu-Development-Setup.html)

### System setup
For minimal environment(docker): check for [UTF-8](https://docs.ros.org/en/galactic/Installation/Ubuntu-Development-Setup.html#set-locale)
```
locale  # check for UTF-8

sudo apt update && sudo apt install locales
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8

locale  # verify settings
```
Check Ubuntu Universe repository
```
apt-cache policy | grep universe
```
The following output should be printed out
```
 500 http://us.archive.ubuntu.com/ubuntu focal/universe amd64 Packages
     release v=20.04,o=Ubuntu,a=focal,n=focal,l=Ubuntu,c=universe,b=amd64
```
If so, skip to add ROS2 apt repo. If not, enable the Universe repository.
```
sudo apt install software-properties-common
sudo add-apt-repository universe
```
Add ROS 2 apt repository to system.
```
sudo apt update && sudo apt install curl gnupg lsb-release
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key  -o /usr/share/keyrings/ros-archive-keyring.gpg
```
Add the repository to source list.
```
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
```
Install development tools and ROS tools.
```
sudo apt update && sudo apt install -y \
  build-essential \
  cmake \
  git \
  python3-colcon-common-extensions \
  python3-flake8 \
  python3-pip \
  python3-pytest-cov \
  python3-rosdep \
  python3-setuptools \
  python3-vcstool \
  wget
# install some pip packages needed for testing
python3 -m pip install -U \
  flake8-blind-except \
  flake8-builtins \
  flake8-class-newline \
  flake8-comprehensions \
  flake8-deprecated \
  flake8-docstrings \
  flake8-import-order \
  flake8-quotes \
  pytest-repeat \
  pytest-rerunfailures \
  pytest \
  setuptools
```
For Ubuntu **18.04**, add the additional dependencies.
```
python3 -m pip install -U importlib-metadata importlib-resources
```
### Get ROS 2 code
Create a workspace and clone all repos.
```
mkdir -p ~/ros2_galactic/src
cd ~/ros2_galactic
wget https://raw.githubusercontent.com/ros2/ros2/galactic/ros2.repos
vcs import src < ros2.repos

```
Install dependencies using `rosdep`.
```
sudo rosdep init
rosdep update
rosdep install --from-paths src --ignore-src --rosdistro galactic -y --skip-keys "console_bridge fastcdr fastrtps rti-connext-dds-5.3.1 urdfdom_headers"
```
Build code in workspace.
```
cd ~/ros2_galactic/
colcon build --symlink-install
```
### Enviroment setup

```
. ~/ros2_galactic/install/local_setup.bash
```

# ROS 2 Configuration
Add to start up script
```
echo "source /opt/ros/galactic/setup.bash" >> ~/.bashrc
echo "source /usr/share/colcon_cd/function/colcon_cd.sh" >> ~/.bashrc
echo "export _colcon_cd_root=~/ros2_install" >> ~/.bashrc

```
Check environment variables.
```
printenv | grep -i ROS
```
The following variables should be set. If not go back to [Installation](https://docs.ros.org/en/galactic/Installation/Ubuntu-Development-Setup.html) or [get help](https://answers.ros.org/questions/)
```
ROS_VERSION=2
ROS_PYTHON_VERSION=3
ROS_DISTRO=galactic
```

## Domain ID
ROS 2 [Domain ID](echo "export ROS_DOMAIN_ID=<your_domain_id>" >> ~/.bashrc) on **Linux** can be a number from 0-101 or 215-232. （Note: I used 100 and it works)
Source domain ID to start up script
```
echo "export ROS_DOMAIN_ID=<your_domain_id>" >> ~/.bashrc
```
