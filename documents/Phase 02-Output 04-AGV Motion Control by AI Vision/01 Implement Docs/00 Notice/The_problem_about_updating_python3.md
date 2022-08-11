# 升级python3.6至python3.9
参考链接
https://blog.csdn.net/qq_43193386/article/details/119801400
# 出现的问题及解决方案
## 1.ImportError: cannot import name '_gi'
无法通过快捷键方式或点击桌面图标打开终端。

点击文件夹，右键选择在终端打开，即可打开终端，或进入字符界面，输入命令`gnome-terminal`，发现报错：
```python
ImportError: cannot import name '_gi'
```

解决方法如下
```
cd /usr/lib/python3/dist-packages/gi/
sudo cp _gi.cpython-36m-x86_64-linux-gnu.so _gi.cpython-39m-x86_64-linux-gnu.so
sudo cp _gi_cairo.cpython-36m-x86_64-linux-gnu.so _gi_cairo.cpython-39m-x86_64-linux-gnu.so
```
## 2.ImportError: cannot import name '_gi' from partially initialized module 'gi'
再次在终端输入命令`gnome-terminal`，发现报错：
```python
ImportError: cannot import name '_gi' from partially initialized module 'gi'
```

解决方法如下
```
apt install python-dev
apt install python3-dev
apt install python3.9-dev 
 
sudo apt-get install libgirepository1.0-dev
sudo apt-get install python-cairo
sudo apt-get install libcairo2

sudo python3 -m pip install -U pycairo
sudo python3.9 -m pip install --ignore-installed PyGObject
```
## 3.AttributeError: module 'gi._gi' has no attribute 'type_from_name'
再次在终端输入命令`gnome-terminal`，发现报错：
```python
File "/usr/local/lib/python3.9/gi/_constants.py", line 23, in <module>
    TYPE_NONE = _gi.type_from_name('void')
AttributeError: module 'gi._gi' has no attribute 'type_from_name'
```

具体原因未知，但调用gi库应该是在`/usr/lib/python3/dist-packages/gi/`，而上面是在`/usr/local/lib/python3.9/gi/`，解决方法如下
```
cd /usr/local/lib/python3.9
sudo rm -r gi
```
之后输入命令`gnome-terminal`，即可成功启动终端。
## 4.其他解决方案
```
sudo gedit /usr/bin/gnome-terminal
```
将第一行改为`#!/usr/bin/python3`或`#!/usr/bin/python3.6`。