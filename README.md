# ENGG233_Digital_Dashboard

## Introduction

### Problem Statement

This project aimed to write the main processing software and the user interface for a digital version of a car’s dashboard. The digital dashboard should be able to display useful information to the driver based on the input sensory data provided (csv files). 

### Project Objective

The project objectives included:

1.	To gain experience with the design and development of a software project using Processing.
2.	To gain practical experience in using programming constructs such as classes, arrays, functions, etc. 
3.	To gain experience with the iterative development process.

## Technologies

The technologies used include:

1. Processing 3.5.3
2. Library gicentreUtils 3.4.0 by Jo Wood and Aidan Slingsby (org.gicentre.utils.stat. library in Processing).

## Solution

The following solution was implemented:

1.	Designed a menu from which the user could select the type of car data they wanted to simulate. The car data used is stored in .csv files and must be provided by the user (example car data provdided with code). The starting menu looks like the below.
<img width="851" alt="Screen Shot 2021-09-05 at 10 19 26 PM" src="https://user-images.githubusercontent.com/72583753/132160082-a77d67af-cc97-4c37-a4c1-e46ef9c57689.png">
2.	Specifically using object-oriented programming, created a dashboard consisting of a speedometer, tachometer (for RPM), fuel gauge, fuel economy, odometer, range, fuel consumption, direction, and visual charts to depict average fuel economy and fuel consumption. The dashboard will look like the below. <img width="853" alt="Screen Shot 2021-09-05 at 10 22 23 PM" src="https://user-images.githubusercontent.com/72583753/132160283-abe3d0de-495f-41d9-99ef-b796bd855ef1.png">

## Launch

In order to launch this project, simply download the folder DigitalDashboard. Once you have the neccessary technologies downloaded (remember the library needed), open the file named DigitalDashboard.pde and click "Run" in the top left.

The starting menu will pop up. If a car simulation is selected, the car dashboard with pop up and start simulating the car data provideed, as shown below.

## Possible Improvements

Possible improvements for this project include:

1.	Be designed to work with any type of file input, rather than specific file names. 
2.	Calculate fuel level without assuming it’s always decreasing. 
3.	Add feature for remaining fuel. 
4.	Calculate a more representative average fuel economy based on recent values, rather than all values. Currently, it slowly averages out, indirectly also causing a plateau for fuel consumption. 
