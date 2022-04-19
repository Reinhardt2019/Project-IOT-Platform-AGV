from launch import LaunchDescription
from launch_ros.actions import Node

def generate_launch_description():
    return LaunchDescription([
        Node(
            package='turtlesim',
            namespace='turtlesim1',
            executable='turtlesim_node',
            name='sim'
        ),
        Node(
            package='my_package',
            namespace='placer',
            executable='place',
            name='place_turtle',
            remappings=[
             ('/out/spawn', '/turtlesim1/spawn'),
            ]
        ),
        Node(
            package='turtlesim',
            executable='mimic',
            name='mimic',
            remappings=[
                ('/input/pose', '/turtlesim1/turtle1/pose'),
                ('/output/cmd_vel', '/turtlesim1/turtle2/cmd_vel'),
            ]
        ),
        Node(
            package='my_package',
            namespace='monitor1',
            executable='monitor',
            name='mon'  ,
            remappings=[
                ('/input/pose', '/turtlesim1/turtle1/pose'),
                ('/output/set_pen', '/turtlesim1/turtle1/set_pen'),
            ]
        )
    ])
