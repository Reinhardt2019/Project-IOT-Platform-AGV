# Issues
- Example镜像版本问题：使用的设备固件无法启动`v1.2.2`镜像
- 其他步骤参考*IOT2050 Setup.pdf*。使用远程连接，用`nmtui`改网络配置和**SUP_Edge**在同一内网
- 换apt源  
  在`/etc/apt/source.list.d/bootstrap.list`里修改，可以使用中科院的Debian源，如下：
  ```vim
  deb http://mirrors.ustc.edu.cn/debian/ buster main contrib non-free
  deb http://mirrors.ustc.edu.cn/debian/ buster-updates main contrib non-free
  deb http://mirrors.ustc.edu.cn/debian/ buster-backports main contrib non-free
  deb http://mirrors.ustc.edu.cn/debian-security/ buster/updates main contrib non-free

  deb-src http://mirrors.ustc.edu.cn/debian/ buster main contrib non-free
  deb-src http://mirrors.ustc.edu.cn/debian/ buster-updates main contrib non-free
  deb-src http://mirrors.ustc.edu.cn/debian/ buster-backports main contrib non-free
  deb-src http://mirrors.ustc.edu.cn/debian-security/ buster/updates main contrib non-free
  ```