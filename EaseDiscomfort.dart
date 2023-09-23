import 'dart:async';

import 'package:another_stepper/dto/stepper_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

class EaseDiscomfort extends StatefulWidget {
  const EaseDiscomfort({Key? key}) : super(key: key);

  @override
  State<EaseDiscomfort> createState() => _AnxietyReleaseState();
}

class _AnxietyReleaseState extends State<EaseDiscomfort> {
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
        backgroundColor: Color(0xFFC9CEF8),
        appBar: AppBar(
          leading: IconButton(
            icon: ImageIcon(AssetImage("images/back_button.png")),
            onPressed: (){},
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("Ease Discomfort",style: TextStyle(
                  fontSize: 30,color: Colors.black
              ),),
            ],
          ),
          backgroundColor: Color(0xFFC9CEF8),
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
                          progressColor: Color(0xFF999DC5),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Step 1:\nBody-Scan Meditation (15 minutes)::",style: TextStyle(fontSize: 15,),),
                      cont("Gradually move your attention up through your feet, ankles, calves, knees, and thighs."),
                      cont("Pay close attention to any areas of discomfort or tension."),
                      cont("As you identify discomfort, imagine your breath flowing to that area, soothing and relaxing it."),
                      SizedBox(height: 30,),
                      Text("Step 2:\nGentle Yoga for Pain Relief (20 minutes):",style: TextStyle(fontSize: 15,),),
                      cont("Perform slow, controlled movements and avoid any positions that exacerbate discomfort."),
                      cont("Pay attention to your breath and maintain a relaxed pace."),
                      cont("After completing the session, lie down in Savasana (corpse pose) for a few minutes to fully relax."),
                      SizedBox(height: 30,),
                      Text("Step 3:\n Self-Compassion Meditation (10 minutes):",style: TextStyle(fontSize: 15,),),
                      cont("Close your eyes and take a few deep breaths.Focus on your breath as you inhale and exhale."),
                      cont("Shift your attention to your breath. Inhale deeply through your nose for a count of 4 seconds."),
                      cont("Exhale slowly through your mouth for a count of 6 seconds."),
                      SizedBox(height: 20,),
                      _isRunning==true? Text("Remaining Time: ${formattedTime}",style: TextStyle(fontSize: 14,),):Text(""),
                      _isRunning!=true?ElevatedButton(
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurpleAccent)),
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
class ProgressControl extends StatefulWidget {
  @override
  _ProgressControlState createState() => _ProgressControlState();
}

class _ProgressControlState extends State<ProgressControl> {
  int _currentValue = 0;
  late Timer _timer;
  bool _isRunning = false;
  int _remainingTime = 20;

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
          if (_currentValue < 20) {
            _currentValue++;
            _remainingTime--; // Decrement remaining time
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 500,
          child: Stack(
            children: [
              SizedBox(width: 10,),
              FAProgressBar(
                direction: Axis.vertical,
                verticalDirection: VerticalDirection.down,
                currentValue: _currentValue.toDouble(),
                maxValue: 20,
                size: 10,
                progressColor: Color(0xFFD4B18F),
                // animatedDuration: Duration(seconds: 10),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _startProgress,
              child: Text('Start'),
            ),
            SizedBox(width: 20),
            ElevatedButton(
              onPressed: _pauseProgress,
              child: Text('Pause'),
            ),
          ],
        ),
      ],
    );
  }
}