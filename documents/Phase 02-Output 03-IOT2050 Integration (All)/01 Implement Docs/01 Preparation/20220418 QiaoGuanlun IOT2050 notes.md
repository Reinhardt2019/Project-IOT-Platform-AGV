#### Q & A

| Q                    | A                                                            |
| -------------------- | ------------------------------------------------------------ |
| IOT2050 支持系统     | 1. Debian - 对应官网的example image<br />2. Industrial OS - 出厂时自带，如果刷掉之后需要重装，需要联系IOT论坛上负责技术支持的同事提供原镜像<br />3. Ubuntu - https://github.com/siemens/meta-iot2050/tree/jan/ubuntu，在开发中的github分支，仍处于开发状态，不是正式release版本，需要自己编译<br />4. 基于Debian的lxde - https://support.industry.siemens.com/tf/ww/en/posts/how-to-install-desktop-environment/237805/?page=0&pageSize=10，apt get 安装lxde，这样就可以在debian系统上跑带有桌面的系统 |
| 官方镜像安装注意事项 | 1. 官方镜像example image安装V1.1.1版本，V1.2.2版本对于部分型号可能不兼容，安装时STAT LED会出现红色高亮报错<br />2. 官方镜像安装时，IOT 2050 默认IP是192.168.200.1<br />3. 官方镜像安装以后，自带node-red，默认访问地址是192.168.200.1:1880<br />4. 官网上的open resource software暂时用处不大，可忽略 |

