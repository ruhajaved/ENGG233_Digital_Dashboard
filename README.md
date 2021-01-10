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
2. Library gicentreUtils 3.4.0 by Jo Wood and Aidan Slingsby

## Solution

The following solution was implemented:

1.	Designed a menu from which the user could select the type of car data they wanted to see. 
2.	Specifically using object-oriented programming, created a dashboard consisting of:
a.	Speedometer, 
b.	Tachometer (for RPM),
c.	Fuel Gauge, 
d.	Fuel Economy, 
e.	Odometer, 
f.	Range, 
g.	Fuel Consumption,
h.	Direction, 
i.	Visual charts to depict average fuel economy and fuel consumption. 

## Launch

In order to launch this project, simply download the folder DigitalDashboard. Once you have the neccessary technologies downloaded (remember the library needed), open the file named DigitalDashboard.pde and click "Run" in the top left.

## Possible Improvements

Possible improvements for this project include:

1.	Be designed to work with any type of file input, rather than specific file names. 
2.	Calculate fuel level without assuming it’s always decreasing. 
3.	Add feature for remaining fuel. 
4.	Calculate a more representative average fuel economy based on recent values, rather than all values. Currently, it slowly averages out, indirectly also causing a plateau for fuel consumption. 
