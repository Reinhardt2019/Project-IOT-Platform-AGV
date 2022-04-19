# 小车Wifi配置及远程登录

> 教程路径：Documents>03 Tools>02 Hardware>01 AGV>1 Reference>03.1.ROS开发手册>1.Wheeltec ROS机器人功能使用与解析
> 
> 相关章节：1.基础操作 2.多机通讯

## 0.小车账号
username:wheeltec

password:dongguan

默认热点名称：wheeltec_raspberry_ros2

默认热点密码：dongguan

默认热点ip: 192.168.0.100

Sup_edge下IP：10.20.240.247

教程中小车默认使用热点连接，现在小车是使用WIFI方式和电脑连接，电脑需要连接Sup_edge

## 1. PC网络设置
远程登录小车时，需要将小车与PC接入同一网络下。

### 1.1 使用Windows主机远程登陆
Windows系统下载Putty工具，在Host Name处输入小车当前ip地址后，使用账号密码登录。使用公司电脑时，需要关闭**Zscaler**防火墙。

### 1.2 使用Ubuntu虚拟机远程登陆
使用虚拟机时，需要在VMware>虚拟机>网络适配器中勾选桥接模式。在terminal中使用`ssh -Y wheeltec@[IP_Address]` 登录，其中`[IP_Address]`需要替换为小车当前IP。
注：公司网络无法使用桥接模式。


## 2. 将AGV接入新的网络


### 2.1 接入网络
#### 2.1.1 使用VNC登录
已知小车当前ip时并且电脑与小车在同一网络下，可以使用VNC工具远程登录树莓派桌面（在ubuntu虚拟机中安装Remmina），在wifi设置中连接新的wifi。VNC使用教程参考手册章节2.2.1
![屏幕截图 2021-11-26 153250.png](https://boostnote.io/api/teams/WmnRSGIQi/files/005855bfcf2cf63468e26f4f89109b6b809369959034264ce4b744aa3c8c5f90-%E5%B1%8F%E5%B9%95%E6%88%AA%E5%9B%BE%202021-11-26%20153250.png)



#### 2.1.2 使用网线登录
在未知小车当前ip时，可以使用网线连接树莓派（树莓派自带一个网络接口），通过路由器设置页面查看小车ip

#### 2.1.3 连接显示器
在未知小车当前ip时，可以使用mini HDMI线连接树莓派（mini HDMI接口靠近树莓派type-c接口，使用端口1），直接进入树莓派桌面

### 2.2 设置静态IP
登录当前网络路由器设置界面，手动设置小车静态IP

### 2.3 开机自动连接
使用VNC登录小车桌面，在网络设置中更改新网络的优先级。在小车开机时，将自动连接优先级高（数字大）的网络。

### 2.4网络与热点切换
小车默认使用热点，进入树莓派操作系统界面，选择disconnect并且选择要连接的账号密码即可。要切换回热点模式，选择connect to Hidden Wifi-Network 连接 Wifi Connection 1. ![image.png](https://boostnote.io/api/teams/WmnRSGIQi/files/15021ea2fb4da49381392f27aa6dac481879e4e2754ec0331069e213262fec7f-image.png)
