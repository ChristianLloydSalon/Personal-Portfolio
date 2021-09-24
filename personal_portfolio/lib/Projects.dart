import 'package:flutter/material.dart';
import 'package:personal_portfolio/Project.dart';

abstract class Projects {
  static List<Project> items = [
    // project 1
    Project(
      title: 'Autonomous Carrier Robot',
      subheader: 'Thesis',
      details: 'An indoor industrial robot that accepts commands from a worker through a ' +
          'mobile application for the purpose of delivering the requested items to the desired location. ' +
          'For the mobile application we used Kotlin, C# for the windows application, ' +
          'and C/C++ for the functionality of the robot. We used the A* algorithm to help the robot ' +
          'navigate indoors.',
      image: Image.asset('images/my-thesis.png'),
      icon: Image.asset('images/robot-icon.png'),
    ),
    // project 2
    Project(
      title: 'E-Sched',
      subheader: "My client's thesis.",
      details:
          'A schedule of loads windows application that creates a summary of data that helps ' +
              'electrical engineers know the equipment ratings and their contribution to the ' +
              'overall power consumption in an installation.',
      image: Image.asset('images/E-Sched.png'),
      icon: Image.asset('images/schedule-icon.png'),
    ),
    // project 3
    Project(
      title: 'Sweeper Follower Robot',
      subheader: "My client's thesis.",
      details:
          'An autonomous robot with trash bin that follows a street sweeper.',
      image: Image.asset('images/sweeper-follower.png'),
      icon: Image.asset('images/robot-icon.png'),
    ),
    // project 4
    Project(
      title: 'Illegal Car Parking Alarm and Notification System',
      subheader: "My client's thesis.",
      details: "The programming languages that I've used for this project are Python for " +
          "Raspberry Pi and C/C++ for Arduino Uno. It detects an illegally parked car in " +
          "an area using OpenCV and Tensorflow for car detection. Once a car is detected, " +
          "a timer will start. Once the timer reaches 3 minutes, it will then send a message " +
          "to an LTO officer.",
      image: Image.asset('images/car-park.png'),
      icon: Image.asset('images/car-icon.png'),
    ),
    // Project 5
    Project(
      title: 'Domination Number Detector Mobile App',
      subheader: "My client's thesis.",
      details: "The Domination Number Detector Mobile Application is designed to " +
          "determine and locate domination number and dominating set in a graph " +
          "that aims to verify concepts in domination for graph theory research and application." +
          "The DND can be used as an instructional tool in Graph Theory, Discrete Math and some Areas " +
          "of Mathematics. This is for educational purpose only.",
      image: Image.asset('images/dnd-app.png'),
      icon: Image.asset('images/graph-icon.png'),
    ),
  ];
}
