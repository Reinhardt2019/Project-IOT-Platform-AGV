useful commands: `ros`+  
- `cd`, `ls`, `cp`, `ed`: no absolute path needed
- `node`  
  - list: display running `node`s
  - info: return info about a specific `node`
- `pack`  
  each `pack`age dir should contains `package.xml`, `CMakeLists.txt`  
  - depends[1]/deps[1]: show [1st-order] dependencies  
    stored in `package.xml` as: `<build_depend>dep</build_depend>` 

- `msg`  
  `node`s communicate with each other by publishing `msg`s  
  descriptions stored in .`msg` files under `pack`_name/`msg`/, in form of `type name`
  - info/show: detail of specific `msg`  
  - list: list all `msg`s
  - build .`msg` in `package.xml`:  
    `<build_depend>message_generation</build_depend>  
     <run_depend>message_runtime</run_depend>` 
- `service`  
  allow `node`s to send a request and receive a response  
  - list: show active `service`s
  - type: show `service` type
  - call: call `service` with provided args
- `srv`  
  describe `service` type in .`srv` files under `pack`_name/`srv`  
  use "---" to seperate request and response `msg` type  
  - info/show: detail of specific `service`
  - list: list all `service`s
- `param`  
  store and manipulate data, including  
  ints (1), floats (0.2), booleans (true), strings ('s')
  dicts ({a: 1, b: 2 }), and lists ([1, 2, 3]),  
  with YAML format.  
  - list: show `param`s on **Parameter Server** (usu. storing static data)
  - load
  - dump  
- `run`  
  `run` a `node` within a `pack`
- `topic`  
  `topic`s send `msg` between `node`s  
  - type: return `msg` type of published `topic`, can be used conjunctively with `msg` show  
    naming as `pack`_name/name.`msg`
  - pub: publish topic with specified type and optional args  
- `launch`  
  start `node`s defined in a `launch` file  
  format:  
  ```xml  
  <launch>
    <include file='$(find pack_name)/launch/file_name.launch'>
    <node pkg='pack_name' name='unique_name' type='exec_file'>
	  <!--use same node file in different scenes-->
      <remap from='origin' to='new'/>
    </node>
    <arg name='foo', default='1'/>
	<arg name='foo1', value='1'/> <!--fixed value-->
	<!--params are shared, global viewable regardless scope-->
	<param name='arg_name' value='$(arg foo)'/>
	<rosparam command='delete' param='param_name'/>
	<rosparam param='param_name'>
	  [1,2,3]
	</rosparam>
	<!--use same namespace for nodes-->
	<group ns=''>
	  <remap from='origin' to='new'/> <!--affect all nodes in this group-->
	  <node ... />
	  <node ... />
	  	<remap from='origin' to='new'/> <!--redefine for specific node-->
	  </node>
	</group>
  </launch>
  ```  
  nodes not neccessary sequentially init
- `rqt_graph`  
- `rqt_console`  

after `catkin_make` $\rightarrow$
catkin_workspace:  
- src
  - pack_name  
    - CMakeLists.txt  
    - package.xml
    - script/*.py, *.sh
    - srv/*.srv
    - msg/*.msg
    - src/*.cpp
    - include/*.h
    - launch/*.launch
- build: buffer and intermediate files  
- devel: object files  

*publisher-subscriber* (pubsub) vs. *server-client* (c/s)  
  - pubsub: topics are global, suitable for networks which need to share data and services
  - c/s: deal with request response