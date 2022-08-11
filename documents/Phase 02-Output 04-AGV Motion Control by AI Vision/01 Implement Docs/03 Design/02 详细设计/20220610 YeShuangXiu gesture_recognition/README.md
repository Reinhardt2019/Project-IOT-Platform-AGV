# 手势识别数据采集与训练
## 数据采集
我们定义了6种手势，分别是`start`、`end`、`turn_left`、`turn_right`、`go_forward`、`go_backward`。运行`get_value.py`采集数据，每个手势采集30组，每组包含30帧双手关节坐标数据,存储在同目录下的MP_Data文件夹中。
其中，手势定义代码为
```python
actions = np.array(['start', 'end', 'turn_left','turn_right', 'go_forward', 'go_backward'])
```
## 模型训练
使用Jupyter依次运行`train.ipynb`中的代码块，LSTM深度学习网络结构定义代码为
```python
model = Sequential()
model.add(LSTM(64, return_sequences=True, activation='relu', input_shape=(5,126)))
model.add(LSTM(128, return_sequences=True, activation='relu'))
model.add(LSTM(64, return_sequences=False, activation='relu'))
model.add(Dense(64, activation='relu',kernel_regularizer=regularizers.l2(0.01),
                activity_regularizer=regularizers.l1(0.01)))
model.add(Dense(32, activation='relu',kernel_regularizer=regularizers.l2(0.01),
                activity_regularizer=regularizers.l1(0.01)))
model.add(Dense(actions.shape[0], activation='softmax'))
model.compile(optimizer='Adam', loss='categorical_crossentropy', metrics=['categorical_accuracy'])
```
训练代码为
```python
model.fit(X_train, y_train, epochs=2000, validation_data=(X_test, y_test), callbacks=[tb_callback], shuffle=True)
```
在训练过程中观察输出结果，当训练集和测试集的识别准确率都接近1时，及时停止训练，防止过拟合。如果训练结果不符合期望，集准确率达到1，可以重新再训练，直到满足要求。

将训练权重保存，命名为`action.h5`。
```python
model.save('action.h5')
```
## 手势识别效果测试
运行`identify.py`测试识别效果。
## 模型调整
为了达到更快的识别速率和更高的识别率，在调试期间对模型做了如下更改：
### 1. 模型输入尺寸修改
将模型改为每5帧识别一次，`input_shape=(5,126)`。
### 2. 在训练过程中加入L1和L2正则化
```python
model.add(Dense(64, activation='relu',kernel_regularizer=regularizers.l2(0.01),
                activity_regularizer=regularizers.l1(0.01)))
model.add(Dense(32, activation='relu',kernel_regularizer=regularizers.l2(0.01),
                activity_regularizer=regularizers.l1(0.01)))
```