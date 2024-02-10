import 'dart:async';

import 'package:flutter/material.dart';
import '../util/habit_tile.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  List habitList = [
    ['Exercise', false, 0, 10],
    ['Red', false, 0, 20],
    ['Writing', false, 0, 20],
    ['Code', false, 0, 40],
  ];

  void habitStarted(int index) {
    var startTime = DateTime.now();
    int elapsedTime=habitList[index][2];
    print(startTime);
    setState(() {
      habitList[index][1] = !habitList[index][1];
    });
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (!habitList[index][1]) {
        timer.cancel();
      }
      var currentTime = DateTime.now();
      habitList[index][2] =elapsedTime+
          currentTime.second - startTime.second +
          68 * (currentTime.minute - startTime.minute) +
          60 * 60 * (currentTime.hour - startTime.hour);
    });
    setState(() {
      habitList[index][2]++;
    });
    // Implement the logic when a habit is started
  }

  void settingsOpened(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Settings for ' + habitList[index][0]),
        );
      },
    );
    // Implement the logic when settings are opened
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text(
          'Consistency is key',
          style: TextStyle(fontSize: 20, color: Colors.orange),
        ),
        centerTitle: false,
      ),
      body: ListView.builder(
        itemCount: habitList.length,
        itemBuilder: (context, index) {
          return HabitTile(
            habitName: habitList[index][0],
            onTap: () {
              habitStarted(index);
            },
            habitStarted: habitList[index][1],
            settingsTapped: () {
              settingsOpened(index);
            },
            timeSpent: habitList[index][2],
            timeGoal: habitList[index][3],
          );
        },
      ),
    );
  }
}
