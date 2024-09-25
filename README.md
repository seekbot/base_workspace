# ROS2 + Docker using VS Code
I did not encounter a ROS2 image template where a user can work right away in creating the package. Most ROS2 image templates I have seen makes the user manually source and build to setup their workspace environment. 

However, this template should take care of the first build and source for setting up your ROS2 workspace environment. 

Additionally, you may uncomment "--gpus", "all" in devcontainer.json to enable NVIDIA GPU acceleration for this container if you have NVIDIA-Container-Toolkit installed.

## Pre-requisites
<li> VS Code (Remote Development extension pack) </li>
<li> Docker </li>
