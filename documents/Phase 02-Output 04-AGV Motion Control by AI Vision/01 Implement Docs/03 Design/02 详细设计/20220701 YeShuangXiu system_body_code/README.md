# 1.代码功能简介
`identify.py`：使用电脑摄像头识别手势并输出结果。
`predict.py`：使用小车摄像头识别手势并输出结果。（运行前需要先开启小车的摄像头节点）
`two_camera.py`：使用电脑或小车的摄像头识别手势并通过ROS节点发布识别结果。（使用小车摄像头键入1，使用电脑摄像头键入2。如果选择使用小车摄像头，运行前需要先开启小车的摄像头节点。）
`action.h5`：手势识别模型，通过python读取并使用。
`agv_control.py`：小车运动控制代码，接收手势识别结果并控制小车运动。
# 2.代码运行坏境配置
```
Ubuntu18.04 + ROS Melodic
python2 (小车运动控制)
python3: tensorflow + mediapipe + opencv + cvbridge + sklearn + matplotlib (手势识别)
```
