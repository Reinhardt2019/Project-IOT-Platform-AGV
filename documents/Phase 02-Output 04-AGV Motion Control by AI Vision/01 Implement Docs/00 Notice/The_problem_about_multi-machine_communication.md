# 问题解决：主机（树莓派）可以获得从机（虚拟机）发布的话题topic，但接收不到topic的内容
## 1.获取主机和从机的名称和ip
在终端输入`hostname`获取名称，输入`ifconfig`获取ip，若显示`ifconfig command not found`，输入以下命令安装net-tools package。
```
sudo apt-get install net-tools
```
## 2.修改主机的/etc/hosts
在主机终端输入
```
sudo gedit /etc/hosts
```
在里面添加：从机ip 从机名称，例如
```
10.20.240.211 siemens
```
## 3.修改从机的/etc/hosts
在从机终端输入
```
sudo gedit /etc/hosts
```
在里面添加：主机ip 主机名称
```
10.20.240.247 wheeltec
```
## 4.修改从机的.bashrc
在从机终端输入
```
sudo gedit ~/.bashrc
```
在里面添加：
```
export ROS_MASTER_URI=http://10.20.240.247:11311 # 固定，小车的ip地址
export ROS_HOSTNAME=从机的ip # 例如：10.20.240.211
export SVGA_VGPU10=0
```
## 5.尝试在主机中ping从机的网络
在主机终端输入
```
ping siemens # 从机的名称
```
观察是否能ping通，如果可以，即表明设置成功。