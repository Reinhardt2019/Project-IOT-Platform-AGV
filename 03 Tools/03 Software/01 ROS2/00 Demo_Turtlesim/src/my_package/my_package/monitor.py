from turtlesim.srv import SetPen
from turtlesim.msg import Pose
from turtlesim.msg import Color

import rclpy
from rclpy.node import Node


class Monitor(Node):

    def __init__(self):
        # create a node
        super().__init__('color_at_point')
        # subscribe to a topic
        self.subscription = self.create_subscription(
            Pose,
            '/input/pose',  # subscribed topic, can use remapping to change
            self.listener_callback,  # a call back function once receive a msg
            10)
        # create a client for changing turtle's pen colour
        self.cli = self.create_client(SetPen,  # service type
                                      '/output/set_pen')  # service name
        # get the format of the request, self.rep will have r,g,b,width,off attributes
        self.req = SetPen.Request()

    def listener_callback(self, msg):
        # when the turtle is in certain area, send a set_pen request
        if msg.x > 5 and msg.y > 6:
            self.send_request(255, 0, 0, 3)
        elif msg.x > 5 and msg.y < 6:
            self.send_request(0, 255, 0, 3)
        elif msg.x < 5 and msg.y > 6:
            self.send_request(0, 0, 255, 3)
        elif msg.x < 5 and msg.y < 6:
            self.send_request(255, 255, 0, 3)

    # send a request
    def send_request(self, r, g, b, w):
        self.req.r = r
        self.req.g = g
        self.req.b = b
        self.req.width = w
        self.future = self.cli.call_async(self.req) # future indicate if the request is successfully completed


def main(args=None):
    rclpy.init(args=args)  # initialize a node
    monitor = Monitor()
    rclpy.spin(monitor)  # pass the node to ros
    # Destroy the node explicitly
    # (optional - otherwise it will be done automatically
    # when the garbage collector destroys the node object)
    monitor.destroy_node()
    rclpy.shutdown()


if __name__ == '__main__':
    main()
