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
