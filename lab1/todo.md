### Setup Web App

1. start the node server: `cd catkin_ws/src/sb_master/sb_web && npx http-server --port 8083 -S -C cert.pem -o -K key.pem &; cd -`
    - open up server address: https://127.0.0.1:8083/sb_head.html

2. `cd catkin_ws/src/sb_master/sb_web && roslaunch rb_server.launch; cd -`
    - started roslaunch server: http://pop-os:35871/
    - rosbridge_websocket: http://127.0.0.1:8080
    - ROS_MASTER_URI: http://localhost:11311
    

## Opening the web app

Once that IP address has been found,
on the device that will be serving as the head (phone on the Survivor Buddy or your own phone or computer when testing)
open up the IP address and port of the rosbridge server.

If my IP were 127.0.0.1 and the port were 8080 for the rosbridge server, I would navigate to `https://127.0.0.1:8080`.

Once there, you should see a warning that says that it is not secureclick on advanced or more information and continue to the site.

![chrome-warning](images/warning.jpg "Chrome warning")

You should then see a blue screen that looks like the following.

![autobahn-screen](images/autobahn.jpg "Success after going through chrome warning")

Then navigate back to the IP address and port of the http-server and the sb_head html. Again, if my IP address were 127.0.0.1, I would navigate to `https://127.0.0.1:8080/sb_head.html`.

![successful-load](images/webpage-success.jpg "Successful webpage load")

Then click connect to ROSbridge server, making sure the IP address and port in the fields are the correct address and port for the rosbridge server. Once connected, click on the record button to start transmitting the camera and audio data wirelessly to the instance of ROS running on your computer.

![rosbridge-success](images/rosbridge-client-connected.png "Successfully connected to rosbridge server")

# Survivor Buddy Hardware Connection Setup

## ROSserial Connection

The microcontroller onboard the Survivor Buddy uses the rosserial library to communicate with ROS and send messages back and forth.

In order to connect to get the microcontroller up and running, first plug in the USB cable from the Survivor Buddy and make sure it is being detected by running the command

```sh
ls /dev/ttyUSB*
```

If the microcontroller is properly connected, you should see /dev/ttyUSB0 as the output of the previous command.

To connect the ROSserial node to your computer, run the following command

```sh
rosrun rosserial_python serial_node.py /dev/ttyUSB0
```

![rosserial-success](images/rosserial-success.png "Successful connection to microcontroller")

To test that the microcontroller is receiving commands, use the following python script to send joint values to Survivor Buddy and make sure that it is moving.

```sh
sb_test_joint_positions.py
```

## Survivor Buddy Hardware Interface Connection

To finish the connection between MoveIt and the Survivor Buddy hardware, there is an interface script that translates the messages coming out of MoveIt to the correct message format that the microcontroller can understand.

To start this node, simply execute the interface layer script with

```sh
python3 sb_interface.py
```

If successful, there will be no output, just a lack of error messages.

You should now be receiving the camera data from the phone in the /camera/image/compressed topic and be receiving the audio data from the phone in the /audio topic. You should also be connected to the Survivor Buddy hardware so you can preview your actions in MoveIt and then see them executed on the physical robot.

Contact me at yashas.salankimatt@tamu.edu or the TA: Sheelabhadra Dey (sheelabhadra@tamu.edu) if you have any questions about these instructions.






### Step 1: Enable sensors

1. Start the websever on the thing with the microphone
2. See `detect_noise` for args and desired output
3. Run `python lab_1.py` to test if the function works
4. You should see `"Noise detected"` being logged into the terminal when a lound noise is detected.

### Step 2: Execute behavior in MoveIt

Next, you need to program a "startle" behavior when an `ALERT` is detected. Once, the sensor is set up, add your code that executes your desired behavior `execute_behavior()` in the space below `"YOUR CODE HERE"` in `lab_1.py`. This is based on the Move Group Interface and for more details, you may refer to [this tutorial](https://ros-planning.github.io/moveit_tutorials/doc/move_group_python_interface/move_group_python_interface_tutorial.html).

> Note: You're free to modify the starter code provided within `execute_behavior()` to create your own custom behaviors.

To start `MoveIt`, in a new terminal window run

```sh
roslaunch sb_moveit_config demo.launch
```

Once you have programmed your desired behavior in `execute_behavior()`, to test your behavior run

```python
python lab_1.py
```

and you can see the behavior being executed in `MoveIt`.

> Note: For the safety of the robot, the angle by which each joint can be moved from the rest position has been restricted to stay within [-45, 45] degrees. At the rest position, all the joint angles are 0 degrees.

### Step 3: Test on SB

Power up SB by connecting to a power outlet. Connect the mini-USB to USB-A cable (will be provided) to create a communication interface between your laptop and the Arduino on SB. The micro-USB end goes into SB.

Follow the instructions at [this repository](https://github.com/yashas-salankimatt/sb_web/) to get the sensor data from the phone and the Survivor Buddy hardware hooked up correctly.

Once you confirm that the interfacing has been successful, run your code

```python
python lab_1.py
```

and record a video of you clapping/making a loud noise and SB executing the "Startle" behavior.

## Grading

In order for your submission to be eligible for grading

- Show that your code works in `MoveIt`. Show this demo to the TA **before** testing it on SB.
- Record a video (with audio) of your code working on SB and upload it to Google drive/YouTube/Vimeo etc. The video should contain a person clapping or a loud noise and the robot's reaction for at least 2 different settings of noise sensitivity, plus any variations.

## Submission

To submit the assignment, please upload the following files to **Canvas -> Assignments -> Programming lab 1**: your script named `lab_1.py`, a `video.txt` file containing a link to the demo video, and a `instructions.txt` file containing instructions on how to run your code if it other than running `python lab_1.py` (e.g. if you adapted your code to accept inputs from the command line). Please upload the files in a single zip file named **<your UIN>.zip**.
