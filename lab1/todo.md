### Step 0:

Install everything:

```sh
cd lab1
. ./.envrc
```

### Step 1.1: Setup Camera Server

Try `run/1_camera_server`

If that doesn't work then:

```sh
# camera_server
npm install http-server
cd ./catkin_ws/src/sb_master/sb_web
npx http-server -S -C cert.pem -o -K key.pem
```

### Step 1.2: Setup Rosbridge

Try `run/2_ros_bridge_server`

If that doesn't work then:

1. figure out your ip address (either `ifconfig` or `ip address`, and look around for things that look like addresses)
2. get the path to your cert file. `cd lab1/catkin_ws/src/sb_master/sb_web; echo; echo "$PWD/cert.pem"`
3. get the path to your key file.  `cd lab1/catkin_ws/src/sb_master/sb_web; echo; echo "$PWD/key.pem"`
4. open rb_server.launch for editing ex: `gedit rb_server.launch`
5. replace the cert file path (two places), key file path (two places), and ip address 
6. run `roslaunch rb_server.launch`

### Step 2: Detect Noise

1. Start the webserver
2. Start the rosbridge
3. Get a device with a camera
    - make sure its on the same wifi
    - open up a browser
    - go to the ip-address of the camera server
    - click the "Connect to ROSbridge Server"
    - then toggle the camera switch to the on position
4. See `def detect_noise` inside of `survivorbuddy_ros/src/lab_1.py` 
5. Add some print statements to `def detect_noise`
6. Try `run/lab_1`, if that doesn't work then `. ./.envrc; python3 ./catkin_ws/src/sb_master/survivorbuddy_ros/src/lab_1.py`
7. Hopefully your print statements are now printing

### Step 3: Execute behavior in MoveIt

1. Find the `def execute_behavior` function in that `lab_1.py`
2. Start moveit with `run/3_moveit`, if that doesn't work then run `. ./.envrc; roslaunch sb_moveit_config demo.launch`

### Step 4: Test on Survivor Buddy

1. Plug in power cord
2. Plug in the USB cable from the Survivor Buddy
3. Make sure it is being detected by running the command `ls /dev/ttyUSB*`, you should see /dev/ttyUSB0 as the output of the previous command.
4. To connect try `run/4_ros_serial`, if that fails try; `. ./.envrc; python3 sb_interface.py &; rosrun rosserial_python serial_node.py /dev/ttyUSB0`
5. To test that the microcontroller is receiving commands, run `run/test_joints`
6. Try `run/lab_1`, if that doesn't work then `. ./.envrc; python3 ./catkin_ws/src/sb_master/survivorbuddy_ros/src/lab_1.py`
7. Record a video of you clapping/making a loud noise and Survivor Buddy executing the "Startle" behavior.

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
