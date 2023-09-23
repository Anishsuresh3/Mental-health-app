import 'dart:async';

import 'package:another_stepper/dto/stepper_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

class AnxietyRelease extends StatefulWidget {
  const AnxietyRelease({Key? key}) : super(key: key);

  @override
  State<AnxietyRelease> createState() => _AnxietyReleaseState();
}

class _AnxietyReleaseState extends State<AnxietyRelease> {
  int _currentValue = 0;
  late Timer _timer;
  bool _isRunning = false;
  int _remainingTime = 120;
  String formattedTime = "";

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startProgress() {
    if (!_isRunning) {
      _isRunning = true;
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {
          if (_currentValue < 120) {
            _currentValue++;
            _remainingTime--;
            int minutes = _remainingTime ~/ 60; // ~/ is used for integer division
            int seconds = _remainingTime % 60;
            formattedTime = '$minutes:${seconds.toString().padLeft(2, '0')}';// Decrement remaining time
          } else {
            _timer.cancel();
            _isRunning = false;
          }
        });
      });
    }
  }

  void _pauseProgress() {
    if (_isRunning) {
      _timer.cancel();
      _isRunning = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7E2CD),
      appBar: AppBar(
        leading: IconButton(
          icon: ImageIcon(AssetImage("images/back_button.png")),
          onPressed: (){},
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text("Anxiety Release",style: TextStyle(
              fontSize: 30,color: Colors.black
            ),),
          ],
        ),
        backgroundColor: Color(0xFFF7E2CD),
        elevation: 0,
        toolbarHeight: 70,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 20,),
                Container(
                  height: 500,
                  child: Stack(
                    children: [
                      SizedBox(width: 10,),
                      FAProgressBar(
                        direction: Axis.vertical,
                        verticalDirection: VerticalDirection.down,
                        currentValue: _currentValue.toDouble(),
                        maxValue: 120,
                        size: 10,
                        progressColor: Color(0xFFD4B18F),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Step 1:\n5-Minute Deep-Breathing Exercise:",style: TextStyle(fontSize: 15,),),
                    cont("Inhale deeply through your nose for a count of 4 seconds.."),
                    cont("Exhale slowly through their mouth for a count of 6 seconds."),
                    SizedBox(height: 30,),
                    Text("Step 2:\n10-Minute Progressive Muscle Relaxation:",style: TextStyle(fontSize: 15,),),
                    cont("tense each muscle group for a few seconds and then release, letting go of any tension."),
                    cont("Start from your toes and work your way up to their head."),
                    SizedBox(height: 30,),
                    Text("Step 3:\n15-Minute Meditation for Anxiety Reduction:",style: TextStyle(fontSize: 15,),),
                    cont("Take a moment to acknowledge any anxiety or stress you may be feeling."),
                    cont("Shift your attention to your breath. Inhale deeply through your nose for a count of 4 seconds."),
                    cont("Exhale slowly through your mouth for a count of 6 seconds."),
                    SizedBox(height: 30,),
                    _isRunning==true? Text("Remaining Time: ${formattedTime}",style: TextStyle(fontSize: 14,),):Text(""),
                    SizedBox(height: 20,),
                    _isRunning!=true?ElevatedButton(
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.brown)),
                        onPressed: _startProgress,
                        child: Text("Start Exercise"),
                    ):Row(
                      children: [
                        IconButton(onPressed: _startProgress, icon: Icon(Icons.play_circle)),
                        IconButton(onPressed: _pauseProgress, icon: Icon(Icons.pause_circle)),
                      ],
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      )
    );
  }
  cont(String msg){
    return Container(
      constraints:  BoxConstraints (
        maxWidth:  300,
      ),
      child: Text("•$msg",style: TextStyle(fontSize: 15,color: Colors.grey)),
    );
  }
}
