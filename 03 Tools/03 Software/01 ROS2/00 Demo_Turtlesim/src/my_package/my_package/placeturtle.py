from turtlesim.srv import Spawn

import rclpy
from rclpy.node import Node


class PlaceTurtle(Node):


    def __init__(self):
        super().__init__('minimal_client_async')
        self.cli = self.create_client(Spawn, '/out/spawn')
        while not self.cli.wait_for_service(timeout_sec=1.0):
            self.get_logger().info('service not available, waiting again...')
        self.req = Spawn.Request()

    def send_request(self):
        self.req.x =3.0
        self.req.y = 3.0
        self.req.theta =0.0
        self.req.name ="turtle2"
        self.future = self.cli.call_async(self.req)


def main():
    rclpy.init()

    minimal_client = PlaceTurtle()
    minimal_client.send_request()

    if rclpy.ok():
        rclpy.spin_once(minimal_client)
        if minimal_client.future.done():
            try:
                response = minimal_client.future.result()
            except Exception as e:
                minimal_client.get_logger().info(
                    'Service call failed %r' % (e,))


    minimal_client.destroy_node()
    rclpy.shutdown()


if __name__ == '__main__':
    main()


