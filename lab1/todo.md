### Step 1: Setup Web App

1. start the node server: `cd catkin_ws/src/sb_master/sb_web && npx http-server --port 8083 -S -C cert.pem -o -K key.pem &; cd -`
    - open up server address: https://127.0.0.1:8083/sb_head.html

2. `cd catkin_ws/src/sb_master/sb_web && roslaunch rb_server.launch; cd -`
    - started roslaunch server: http://pop-os:35871/
    - rosbridge_websocket: https://127.0.0.1:8080
    - ROS_MASTER_URI: http://localhost:11311

### Step 2: Detect Noise

1. Start the webserver, connect a device with input
2. See `detect_noise` for args and desired output
3. Run `python lab_1.py` to test if the function works
4. You should see `"Noise detected"` being logged into the terminal when a lound noise is detected.

### Step 3: Execute behavior in MoveIt

1. Find the `execute_behavior` function in `lab_1.py`
2. Start `MoveIt`, by running `roslaunch sb_moveit_config demo.launch`
    - Note: For the safety of the robot, the angle by which each joint can be moved from the rest position has been restricted to stay within [-45, 45] degrees. At the rest position, all the joint angles are 0 degrees.

### Step 4: Test on Survivor Buddy

1. Plug in power cord
2. Plug in the USB cable from the Survivor Buddy
3. Make sure it is being detected by running the command `ls /dev/ttyUSB*`, you should see /dev/ttyUSB0 as the output of the previous command.
4. To connect run `rosrun rosserial_python serial_node.py /dev/ttyUSB0`
5. To test that the microcontroller is receiving commands, run `sb_test_joint_positions.py`
6. Start the moveit connection with `python3 sb_interface.py` (If successful, there will be no output, just a lack of error messages)
7. Run `python lab_1.py`
8. Record a video of you clapping/making a loud noise and Survivor Buddy executing the "Startle" behavior.

## Grading

1. Demo the simulator to the TA 
2. Record a video (with audio)
    - Include the person that is clapping
    - Include the robot's reaction
    - Show at least 2 different settings of noise sensitivity
    - Show some variations of sound
    - Upload it to Google drive/YouTube/Vimeo

## Submission

1. Create a folder with three things
    - your script named `lab_1.py`
    - a `video.txt` file containing a link to the demo video
    - an `instructions.txt` file containing instructions on how to run your code if it other than running `python lab_1.py` (e.g. if you adapted your code to accept inputs from the command line)
2. Zip them into a file named **<your UIN>.zip**
3. Upload the zip to **Canvas -> Assignments -> Programming lab 1**
