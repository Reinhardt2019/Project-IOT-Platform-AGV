# SQLite3 Configuration with ROS

## Installation

AGV cannot do `sudo apt update` nor `sudo apt install sqlite3 `. SQLite3 need to be built from source. [Reference](https://www.runoob.com/sqlite/sqlite-installation.html). Run `sudo make install` instead. 



## Use SQLite3 in ROS




### In source code

As instructed on the [C++ interface](https://www.sqlite.org/capi3ref.html)



### add `CMakeList.txt`

```
include_directories(/usr/include)
link_directories(${catkin_LIB_DIRS} /usr/lib/x86_64-linux-gnu/libsqlite3.so)
find_package(SQLite3 REQUIRED)
target_link_libraries(database_server ${catkin_LIBRARIES} ${SQLite3_LIBRARIES}) 
```

Note: `FindSQLite3.cmake` is available for cmake version after 3.14. The current `cmake` version on 
 AGV is 3.10.
 
## SQLite3 Resource 

[official documentation](https://www.sqlite.org/docs.html)


[菜鸟教程](https://www.runoob.com/sqlite/sqlite-installation.html)
