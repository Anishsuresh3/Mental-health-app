import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

class EasingDepression extends StatefulWidget {
  const EasingDepression({Key? key}) : super(key: key);

  @override
  State<EasingDepression> createState() => _EasingDepressionState();
}

class _EasingDepressionState extends State<EasingDepression> {
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
        backgroundColor: Color(0xFFEDC9ED),
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              size: 30.0,
              Icons.arrow_back_ios_rounded,
              color: Colors.blueGrey,
            ),
            onPressed: (){Navigator.of(context).pop();},
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("Easing Depression",style: TextStyle(
                  fontSize: 30,color: Colors.black
              ),),
            ],
          ),
          backgroundColor: Color(0xFFEDC9ED),
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
                          progressColor: Color(0xFFC476C4),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Step 1:\nMindfulness Meditation for Self-Compassion\n(10 minutes):",style: TextStyle(fontSize: 15,),),
                      cont("Close your eyes and take a few deep breaths.Focus on your breath as you inhale and exhale."),
                      cont("Shift your attention to your breath. Inhale deeply through your nose for a count of 4 seconds."),
                      cont("Exhale slowly through your mouth for a count of 6 seconds."),
                      SizedBox(height: 30,),
                      Text("Step 2:\nGratitude Journaling (5 minutes):",style: TextStyle(fontSize: 15,),),
                      cont("Write down three things you're grateful for today, no matter how small."),
                      cont("Reflect on the positive aspects of your life and focus on moments of joy or beauty."),
                      SizedBox(height: 30,),
                      Text("Step 3:\nMeditation for Managing Depressive Thoughts\n(20 minutes):",style: TextStyle(fontSize: 15,),),
                      cont("Explore mindfulness practices that help you observe and detach from negative thought patterns."),
                      cont("Learn to reframe negative thoughts and replace them with more positive and compassionate ones."),
                      cont("Visualize letting go of depressive thoughts like clouds passing by."),
                      SizedBox(height: 20,),
                      _isRunning==true? Text("Remaining Time: ${formattedTime}",style: TextStyle(fontSize: 14,),):Text(""),
                      _isRunning!=true?ElevatedButton(
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.purple)),
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
      child: Text("•$msg",style: TextStyle(fontSize: 15,color: Colors.blueGrey)),
    );
  }
}