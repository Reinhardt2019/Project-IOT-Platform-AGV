/*
 *  RPLIDAR ROS NODE
 *
 *  Copyright (c) 2009 - 2014 RoboPeak Team
 *  http://www.robopeak.com
 *  Copyright (c) 2014 - 2016 Shanghai Slamtec Co., Ltd.
 *  http://www.slamtec.com
 *
 */
/*
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice,
 *    this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 *    this list of conditions and the following disclaimer in the documentation
 *    and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
 * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
 * OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
 * OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 */

#include "ros/ros.h"
#include "sensor_msgs/LaserScan.h"
#include "std_srvs/Empty.h"
#include "rplidar.h"

#include <dynamic_reconfigure/server.h>
#include <rplidar_ros/paramsConfig.h>

#ifndef _countof
#define _countof(_Array) (int)(sizeof(_Array) / sizeof(_Array[0]))
#endif

#define DEG2RAD(x) ((x)*M_PI/180.) // 角度转弧度

using namespace rp::standalone::rplidar;

RPlidarDriver * drv = NULL;
double angle_start, angle_end, distance_min, distance_max,angle_cur,
       angle1_start,angle1_end,angle2_start,angle2_end,angle3_start,angle3_end,angle4_start,angle4_end;
bool is_parted;

//交换函数
template<class T>
void swap(T &a,T &b){
    T temp = a;
    a = b;
    b = temp;
}

//判断角度          起始角度         结束角度        当前角度   
bool jdg_ang(double angle_s,double angle_e,double angle_c){
    if (angle_s<=angle_e){
        return angle_c>=angle_s&&angle_c<angle_e;
    }
    else{
        return angle_c>=angle_s||angle_c<=angle_e;
    }
}

// dynamic_reconfigure 回调函数
void reconfigCB(rplidar_ros::paramsConfig &config,uint32_t level)
{
    angle_start = config.angle_start;
    angle_end = config.angle_end;
    // 当最小扫描半径大于最大扫描半径时，将二者值互换
    if(config.distance_max < config.distance_min)
    {   
        swap<double>(config.distance_min,config.distance_max);
    }
    
    distance_max = config.distance_max;
    distance_min = config.distance_min;

    // 是否分割雷达扫描角度
    is_parted = config.is_parted;

    // 第一个屏蔽角度
    angle1_start = config.angle1_start;
    angle1_end = config.angle1_end;

    // 第二个屏蔽角度
    angle2_start = config.angle2_start;
    angle2_end = config.angle2_end;

    // 第三个屏蔽角度
    angle3_start = config.angle3_start;
    angle3_end = config.angle3_end;

    // 第四个屏蔽角度
    angle4_start = config.angle4_start;
    angle4_end = config.angle4_end;

    ROS_INFO("min_distance:%lf,max_distance:%lf",distance_min,distance_max);

    if (is_parted){
        ROS_INFO("\nangle1_start:%lf,angle1_end:%lf\nangle2_start:%lf,angle2_end:%lf\nangle3_start:%lf,angle3_end:%lf\nangle4_start:%lf,angle4_end:%lf",angle1_start,angle1_end,angle2_start,angle2_end,angle3_start,angle3_end,angle4_start,angle4_end);
    }
    else{
        ROS_INFO("angle_start:%lf,angle_end:%lf",angle_start,angle_end);   
    } 

}


// 雷达话题
void publish_scan(ros::Publisher *pub,
                  rplidar_response_measurement_node_hq_t *nodes,
                  size_t node_count, ros::Time start,
                  double scan_time, bool inverted,
                  float angle_min, float angle_max,
                  float max_distance,
                  std::string frame_id)
{
    static int scan_count = 0;
    sensor_msgs::LaserScan scan_msg; // 创建雷达msg
    scan_msg.header.stamp = start; // 扫描起始时间
    scan_msg.header.frame_id = frame_id; // 序列id
    scan_count++;

    bool reversed = (angle_max > angle_min);
    if ( reversed ) {
      scan_msg.angle_min =  M_PI - angle_max;
      scan_msg.angle_max =  M_PI - angle_min;
    } else {
      scan_msg.angle_min =  M_PI - angle_min;
      scan_msg.angle_max =  M_PI - angle_max;
    }
    scan_msg.angle_increment =
        (scan_msg.angle_max - scan_msg.angle_min) / (double)(node_count-1); // 扫描精度

    scan_msg.scan_time = scan_time; // 扫描开始时间
    scan_msg.time_increment = scan_time / (double)(node_count-1); // 时间间隔
    scan_msg.range_min = 0.15; // 扫描最小半径
    scan_msg.range_max = max_distance; // 扫描最大半径

    scan_msg.intensities.resize(node_count); // 强度数据，是一个数组，与设备有关。
    scan_msg.ranges.resize(node_count); // 距离数据，是一个数组，激光转一周的测量数据。
    bool reverse_data = (!inverted && reversed) || (inverted && !reversed);
    /*if (!reverse_data) {
        for (size_t i = angle_start*node_count/360; i < angle_end*node_count/360; i++) {
            float read_value = (float) nodes[i].dist_mm_q2/4.0f/1000;
            if (read_value == 0.0)
                scan_msg.ranges[i] = std::numeric_limits<float>::infinity();
            else
                scan_msg.ranges[i] = read_value;
            scan_msg.intensities[i] = (float) (nodes[i].quality >> 2);
        }
    } else {
        for (size_t i = angle_start*node_count/360; i < angle_end*node_count/360; i++) {
            float read_value = (float)nodes[i].dist_mm_q2/4.0f/1000;
            if (read_value == 0.0)
                scan_msg.ranges[node_count-1-i] =getRPLIDARDeviceInfo std::numeric_limits<float>::infinity();
            else
                scan_msg.ranges[node_count-1-i] = read_value;
            scan_msg.intensities[node_count-1-i] = (float) (nodes[i].quality >> 2);
        }
    }*/
    
    //是否分割角度

    //不分割角度
    if (!is_parted){
        if (!reverse_data) {
            for (size_t i = 0; i < node_count; i++) {
                float read_value = (float) nodes[i].dist_mm_q2/4.0f/1000;
                 //angle_cur为当前扫描角度
                angle_cur = i*360/node_count;
                if(angle_end>=angle_start)
                  {
                    if(angle_cur>angle_end || angle_cur<angle_start)read_value=0;
                  }
                else
                  {
                    if(angle_cur>angle_end && angle_cur<angle_start)read_value=0;
                  }
                // if (read_value == 0.0)
                if (read_value <= distance_min || read_value >= distance_max)
                    scan_msg.ranges[i] = std::numeric_limits<float>::infinity();  // 如果不在角度不在扫描范围内，将该角度对应的目标距离置为无穷大
                else
                    scan_msg.ranges[i] = read_value;
                scan_msg.intensities[i] = (float) (nodes[i].quality >> 2);
            }
        } else {
            for (size_t i = 0; i < node_count; i++) {
                float read_value = (float)nodes[i].dist_mm_q2/4.0f/1000;
                //angle_cur为当前扫描角度
                angle_cur = i*360/node_count;                
                if(angle_end>=angle_start)
                  {
                    if(angle_cur>angle_end || angle_cur<angle_start)read_value=0;
                  }
                else
                  {
                    if(angle_cur>angle_end && angle_cur<angle_start)read_value=0;
                  }
                //if (read_value == 0.0)
                if (read_value <= distance_min || read_value >= distance_max)
                    scan_msg.ranges[node_count-1-i] = std::numeric_limits<float>::infinity();
                else
                    scan_msg.ranges[node_count-1-i] = read_value;
                scan_msg.intensities[node_count-1-i] = (float) (nodes[i].quality >> 2);
            }
        }
    }
    //分割角度
    else{
        if (!reverse_data) {
            for (size_t i = 0; i < node_count; i++) {
                float read_value = (float) nodes[i].dist_mm_q2/4.0f/1000;
                //angle_cur为当前扫描角度
                angle_cur = i*360/node_count;
                if (jdg_ang(angle1_start,angle1_end,angle_cur)||
                    jdg_ang(angle2_start,angle2_end,angle_cur)||
                    jdg_ang(angle3_start,angle3_end,angle_cur)||
                    jdg_ang(angle4_start,angle4_end,angle_cur))
                {
                    read_value=0;
                }

                // if (read_value == 0.0)
                if (read_value <= distance_min || read_value >= distance_max)
                    scan_msg.ranges[i] = std::numeric_limits<float>::infinity();  // 如果不在角度不在扫描范围内，将该角度对应的目标距离置为无穷大
                else
                    scan_msg.ranges[i] = read_value;
                scan_msg.intensities[i] = (float) (nodes[i].quality >> 2);
            }
        } else {
            for (size_t i = 0; i < node_count; i++) {
                float read_value = (float)nodes[i].dist_mm_q2/4.0f/1000;
                //angle_cur为当前扫描角度
                angle_cur = i*360/node_count;
                if (jdg_ang(angle1_start,angle1_end,angle_cur)||
                    jdg_ang(angle2_start,angle2_end,angle_cur)||
                    jdg_ang(angle3_start,angle3_end,angle_cur)||
                    jdg_ang(angle4_start,angle4_end,angle_cur))
                {
                    read_value=0;
                }

                //if (read_value == 0.0)
                if (read_value <= distance_min || read_value >= distance_max)
                    scan_msg.ranges[node_count-1-i] = std::numeric_limits<float>::infinity();
                else
                    scan_msg.ranges[node_count-1-i] = read_value;
                scan_msg.intensities[node_count-1-i] = (float) (nodes[i].quality >> 2);
            }
        }
    }
    pub->publish(scan_msg);
}

bool getRPLIDARDeviceInfo(RPlidarDriver * drv)
{
    u_result     op_result;
    rplidar_response_device_info_t devinfo;

    op_result = drv->getDeviceInfo(devinfo);
    if (IS_FAIL(op_result)) {
        if (op_result == RESULT_OPERATION_TIMEOUT) {
            ROS_ERROR("Error, operation time out. RESULT_OPERATION_TIMEOUT! ");
        } else {
            ROS_ERROR("Error, unexpected error, code: %x",op_result);
        }
        return false;
    }

    // print out the device serial number, firmware and hardware version number..
    // 打印出设备序列号，固件和硬件版本号
    printf("RPLIDAR S/N: ");
    for (int pos = 0; pos < 16 ;++pos) {
        printf("%02X", devinfo.serialnum[pos]);
    }
    printf("\n");
    ROS_INFO("Firmware Ver: %d.%02d",devinfo.firmware_version>>8, devinfo.firmware_version & 0xFF);
    ROS_INFO("Hardware Rev: %d",(int)devinfo.hardware_version);
    return true;
}

bool checkRPLIDARHealth(RPlidarDriver * drv)
{
    u_result     op_result;
    rplidar_response_device_health_t healthinfo;
    op_result = drv->getHealth(healthinfo);
    if (IS_OK(op_result)) { 
        ROS_INFO("RPLidar health status : %d", healthinfo.status);
        if (healthinfo.status == RPLIDAR_STATUS_ERROR) {
            ROS_ERROR("Error, rplidar internal error detected. Please reboot the device to retry.");
            return false;
        } else {
            return true;
        }

    } else {
        ROS_ERROR("Error, cannot retrieve rplidar health code: %x", op_result);
        return false;
    }
}

bool stop_motor(std_srvs::Empty::Request &req,
                               std_srvs::Empty::Response &res)
{
  if(!drv)
       return false;

  ROS_DEBUG("Stop motor");
  drv->stopMotor();
  return true;
}

bool start_motor(std_srvs::Empty::Request &req,
                               std_srvs::Empty::Response &res)
{
  if(!drv)
       return false;
  if(drv->isConnected())
  {
      ROS_DEBUG("Start motor");
      u_result ans=drv->startMotor();
  
      ans=drv->startScan(0,1);
   }
   else ROS_INFO("lost connection");
  return true;
}

static float getAngle(const rplidar_response_measurement_node_hq_t& node)
{
    return node.angle_z_q14 * 90.f / 16384.f;
}


int main(int argc, char * argv[]) {
    ros::init(argc, argv, "rplidar_node");
    
    std::string channel_type;
    std::string tcp_ip;
    std::string serial_port;
    int tcp_port = 20108;
    int serial_baudrate = 115200;
    std::string frame_id;
    bool inverted = false;
    bool angle_compensate = true;
    float max_distance = 8.0;
    int angle_compensate_multiple = 1; // it stand of angle compensate at per 1 degree  // 它的角度补偿每1度
    
    std::string scan_mode;
    ros::NodeHandle nh;
    ros::Publisher scan_pub = nh.advertise<sensor_msgs::LaserScan>("scan", 1000);
    ros::NodeHandle nh_private("~");
    nh_private.param<std::string>("channel_type", channel_type, "serial");
    nh_private.param<std::string>("tcp_ip", tcp_ip, "192.168.0.7"); 
    nh_private.param<int>("tcp_port", tcp_port, 20108);
    nh_private.param<std::string>("serial_port", serial_port, "/dev/ttyUSB0"); 
    nh_private.param<int>("serial_baudrate", serial_baudrate, 115200/*256000*/); // ros run for A1 A2, change to 256000 if A3  // A1,A2的值，如果是A3则改为256000
    nh_private.param<std::string>("frame_id", frame_id, "laser_frame");
    nh_private.param<bool>("inverted", inverted, false);
    nh_private.param<bool>("angle_compensate", angle_compensate, false);
    nh_private.param<std::string>("scan_mode", scan_mode, std::string());
    nh_private.param<double>("angle_start", angle_start, 0);
    nh_private.param<double>("angle_end", angle_end, 360);
    nh_private.param<double>("distance_min", distance_min, 0);
    nh_private.param<double>("distance_max", distance_max, 10);
    nh_private.param<bool>("is_parted",is_parted,false);

    //第一个屏蔽角度
    nh_private.param<double>("angle1_start",angle1_start,40);
    nh_private.param<double>("angle1_end",angle1_end,50);

    //第二个屏蔽角度
    nh_private.param<double>("angle2_start",angle2_start,130);
    nh_private.param<double>("angle2_end",angle2_end,140);

    //第三个屏蔽角度
    nh_private.param<double>("angle3_start",angle3_start,130);
    nh_private.param<double>("angle3_end",angle3_end,140);
    
    //第四个屏蔽角度
    nh_private.param<double>("angle4_start",angle4_start,130);
    nh_private.param<double>("angle4_end",angle4_end,140);
    
    // Dynamic Reconfigure
    dynamic_reconfigure::Server<rplidar_ros::paramsConfig> dynamic_reconfigure_server;
    dynamic_reconfigure::Server<rplidar_ros::paramsConfig>::CallbackType dynamic_reconfigure_callback;
    dynamic_reconfigure_callback = boost::bind(&reconfigCB,_1, _2);
    
    dynamic_reconfigure_server.setCallback(dynamic_reconfigure_callback);
    
    
    ROS_INFO("RPLIDAR running on ROS package rplidar_ros. SDK Version:"RPLIDAR_SDK_VERSION"");

    u_result     op_result;

    // create the driver instance
    // 创建驱动程序实例
    if(channel_type == "tcp"){
        drv = RPlidarDriver::CreateDriver(rp::standalone::rplidar::DRIVER_TYPE_TCP);
    }
    else{
        drv = RPlidarDriver::CreateDriver(rp::standalone::rplidar::DRIVER_TYPE_SERIALPORT);
    }

    
    if (!drv) {
        ROS_ERROR("Create Driver fail, exit");
        return -2;
    }

    if(channel_type == "tcp"){
        // make connection...
        if (IS_FAIL(drv->connect(tcp_ip.c_str(), (_u32)tcp_port))) {
            ROS_ERROR("Error, cannot bind to the specified serial port %s.",serial_port.c_str());
            RPlidarDriver::DisposeDriver(drv);
            return -1;
        }

    }
    else{
       // make connection...
        if (IS_FAIL(drv->connect(serial_port.c_str(), (_u32)serial_baudrate))) {
            ROS_ERROR("Error, cannot bind to the specified serial port %s.",serial_port.c_str());
            RPlidarDriver::DisposeDriver(drv);
            return -1;
        }

    }
    
    // get rplidar device info
    // 获取雷达设备信息
    if (!getRPLIDARDeviceInfo(drv)) {
        return -1;
    }

    // check health...
    if (!checkRPLIDARHealth(drv)) {
        RPlidarDriver::DisposeDriver(drv);
        return -1;
    }

    ros::ServiceServer stop_motor_service = nh.advertiseService("stop_motor", stop_motor);
    ros::ServiceServer start_motor_service = nh.advertiseService("start_motor", start_motor);

    drv->startMotor();

    RplidarScanMode current_scan_mode;
    if (scan_mode.empty()) {
        op_result = drv->startScan(false /* not force scan */, true /* use typical scan mode */, 0, &current_scan_mode);
    } else {
        std::vector<RplidarScanMode> allSupportedScanModes;
        op_result = drv->getAllSupportedScanModes(allSupportedScanModes);

        if (IS_OK(op_result)) {
            _u16 selectedScanMode = _u16(-1);
            for (std::vector<RplidarScanMode>::iterator iter = allSupportedScanModes.begin(); iter != allSupportedScanModes.end(); iter++) {
                if (iter->scan_mode == scan_mode) {
                    selectedScanMode = iter->id;
                    break;
                }
            }

            if (selectedScanMode == _u16(-1)) {
                ROS_ERROR("scan mode `%s' is not supported by lidar, supported modes:", scan_mode.c_str());
                for (std::vector<RplidarScanMode>::iterator iter = allSupportedScanModes.begin(); iter != allSupportedScanModes.end(); iter++) {
                    ROS_ERROR("\t%s: max_distance: %.1f m, Point number: %.1fK",  iter->scan_mode,
                            iter->max_distance, (1000/iter->us_per_sample));
                }
                op_result = RESULT_OPERATION_FAIL;
            } else {
                op_result = drv->startScanExpress(false /* not force scan */, selectedScanMode, 0, &current_scan_mode);
            }
        }
    }

    if(IS_OK(op_result))
    {
        // default frequent is 10 hz (by motor pwm value),  current_scan_mode.us_per_sample is the number of scan point per us
        // 默认频率是10hz(由电机PWM值)，current_scan_mode.Us_per_sample是每个我们扫描点的数量
        angle_compensate_multiple = (int)(1000*1000/current_scan_mode.us_per_sample/10.0/360.0);
        if(angle_compensate_multiple < 1) 
          angle_compensate_multiple = 1;
        max_distance = current_scan_mode.max_distance;
        ROS_INFO("current scan mode: %s, max_distance: %.1f m, Point number: %.1fK , angle_compensate: %d",  current_scan_mode.scan_mode,
                 current_scan_mode.max_distance, (1000/current_scan_mode.us_per_sample), angle_compensate_multiple);
    }
    else
    {
        ROS_ERROR("Can not start scan: %08x!", op_result);
    }

    ros::Time start_scan_time;
    ros::Time end_scan_time;
    double scan_duration;
    while (ros::ok()) {
        rplidar_response_measurement_node_hq_t nodes[360*8];
        size_t   count = _countof(nodes);

        start_scan_time = ros::Time::now();
        op_result = drv->grabScanDataHq(nodes, count);
        end_scan_time = ros::Time::now();
        scan_duration = (end_scan_time - start_scan_time).toSec();

        if (op_result == RESULT_OK) {
            op_result = drv->ascendScanData(nodes, count);
            float angle_min = DEG2RAD(0.0f); // 将角度值转换为弧度值
            float angle_max = DEG2RAD(359.0f);
            if (op_result == RESULT_OK) {
                if (angle_compensate) {
                    // const int angle_compensate_multiple = 1;
                    const int angle_compensate_nodes_count = 360*angle_compensate_multiple;
                    int angle_compensate_offset = 0;
                    rplidar_response_measurement_node_hq_t angle_compensate_nodes[angle_compensate_nodes_count];
                    memset(angle_compensate_nodes, 0, angle_compensate_nodes_count*sizeof(rplidar_response_measurement_node_hq_t));

                    int i = 0, j = 0;
                    for( ; i < count; i++ ) {
                        if (nodes[i].dist_mm_q2 != 0) {
                            float angle = getAngle(nodes[i]);
                            int angle_value = (int)(angle * angle_compensate_multiple);
                            if ((angle_value - angle_compensate_offset) < 0) angle_compensate_offset = angle_value;
                            for (j = 0; j < angle_compensate_multiple; j++) {

                                int angle_compensate_nodes_index = angle_value-angle_compensate_offset+j;
                                if(angle_compensate_nodes_index >= angle_compensate_nodes_count)
                                    angle_compensate_nodes_index = angle_compensate_nodes_count-1;
                                angle_compensate_nodes[angle_compensate_nodes_index] = nodes[i];
                            }
                        }
                    }

                    publish_scan(&scan_pub, angle_compensate_nodes, angle_compensate_nodes_count,
                             start_scan_time, scan_duration, inverted,
                             angle_min, angle_max, max_distance,
                             frame_id);
                } else {
                    int start_node = 0, end_node = 0;
                    int i = 0;
                    // find the first valid node and last valid node
                    // 找到第一个有效节点和最后一个有效节点
                    while (nodes[i++].dist_mm_q2 == 0);
                    start_node = i-1;
                    i = count -1;
                    while (nodes[i--].dist_mm_q2 == 0);
                    end_node = i+1;

                    angle_min = DEG2RAD(getAngle(nodes[start_node]));
                    angle_max = DEG2RAD(getAngle(nodes[end_node]));

                    publish_scan(&scan_pub, &nodes[start_node], end_node-start_node +1,
                             start_scan_time, scan_duration, inverted,
                             angle_min, angle_max, max_distance,
                             frame_id);
               }
            } else if (op_result == RESULT_OPERATION_FAIL) {
                // All the data is invalid, just publish them
                // 所有的数据都是无效的，只管发布它们
                float angle_min = DEG2RAD(0.0f);
                float angle_max = DEG2RAD(359.0f);
                publish_scan(&scan_pub, nodes, count,
                             start_scan_time, scan_duration, inverted,
                             angle_min, angle_max, max_distance,
                             frame_id);
            }
        }

        ros::spinOnce();
    }

    // done!
    drv->stopMotor();
    drv->stop();
    RPlidarDriver::DisposeDriver(drv);
    return 0;
}
