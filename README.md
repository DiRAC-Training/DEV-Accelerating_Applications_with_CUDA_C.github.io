# DEV Accelerating Applications with CUDA C

## Welcome:
to the DiRAC repositort for the Accelerating Applications with CUDA using C. This course was based on the Nividia course of the same name and can be found at <https://courses.nvidia.com/courses/course-v1:DLI+C-AC-01+V1>
We would like to thank Nvidia for letting us use there material.

## Overview
The course is an intrioduction to CUDA using the C language. As such is intended for researchers who are already farmilure with C, but whant to sart ther journy into CUDA.

## Prerequisits
Basic C/C++ competency including familiarity with variable types, loops, conditional statements, functions, and array manipulations. No previous knowledge of CUDA programming is assumed.

## Related Training

- **DiRAC Foundation-HPC course:** This is a basic course into HPC that will help researchers new to HPC systems get started quickly. The course covers basic BASH skills, Git, Software Engineering, Testing and Documentation, and code scalability.

## Note:
Currently this course only works on Cambages RCS CSD3 Facility. If you do not have an accout please apply for one that will give you access to the GPUs. DiRAC has a training project available for DiRAC uses, called dt001.

## Getting Started
- logon to you desired HPC system .eg. CSD3
- clone this repository
- run script ./run_course.sh This will ask if you have a resivation, and than check to see if there is a GPU available. If there is it will requiest use of the GPU for 8 hours and connect you to the system.
- When on GPU syste run the script ./startJupyter.sh. This will create a juypter enviroment and give you instruction on how to complete setup.
- create a ssh connection so you can use you local browser to access the jupyter server run on the remore HPC system. The start Jupyter script will print out a commans for you to run in a separate terminal instance. it will look simmilar to ssh -L 9562:gpu-q-80:9562 -fN **[username]**@login-e-2.hpc.cam.ac.uk. You need to insert you username and run this command in a local terminal window. You will have to 
