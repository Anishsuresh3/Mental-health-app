// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Mood extends StatefulWidget {
  const Mood({Key? key}) : super(key: key);

  @override
  State<Mood> createState() => _MoodState();
}

class _MoodState extends State<Mood> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(),
        body: SingleChildScrollView(
          reverse: true,
          child: Container(
            padding: EdgeInsets.only(left: 10),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20,),
                  const Text("How are you feeling?", textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),),
                  SizedBox(height: 20,),
                  EmojiSelector(),
                  SizedBox(height: 20,),
                  const Text("What’s affecting your mood?",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),),
                  SizedBox(height: 20,),
                  MultipleSelectionChoiceChips(),
                  SizedBox(height: 40,),
                  const Text("Let’s write about it",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),),
                  SizedBox(height: 20,),
                  NoteTypingArea(),
                  //Button should be added
                ],
              ),
            ),
          ),
        )
    );
  }
}
class NoteTypingArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350, // Adjust the width as needed
      height: 100, // Adjust the height as needed
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey), // Add border for the container
        borderRadius: BorderRadius.circular(10.0), // Add border radius
      ),
      child: SingleChildScrollView(
        child: TextField(
          decoration: InputDecoration(
            hintText: 'How is your day going?\nHow is it affecting your mood?\nOr anything else...', // Placeholder text
            contentPadding: EdgeInsets.all(10.0), // Padding inside the text field
            border: InputBorder.none, // Remove default border
          ),
          maxLines: null, // Allow multiple lines for typing
          keyboardType: TextInputType.multiline, // Enable multiline input
        ),
      ),
    );
  }
}
class MultipleSelectionChoiceChips extends StatefulWidget {
  @override
  _MultipleSelectionChoiceChipsState createState() =>
      _MultipleSelectionChoiceChipsState();
}

class _MultipleSelectionChoiceChipsState
    extends State<MultipleSelectionChoiceChips> {
  List<int> _selectedChipIndices = [];

  final List<String> chipLabels = [
    'Work',
    'Exercise',
    'Family',
    'Hobbies',
    'Finances',
    'Sleep',
    'Drink',
    'Food',
    'Relationships',
    'Education',
    'Weather'
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      children: List<Widget>.generate(
        chipLabels.length,
            (int index) {
          final isSelected = _selectedChipIndices.contains(index);

          return ChoiceChip(
            label: Text(chipLabels[index]),
            labelStyle: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
            ),
            selected: isSelected,
            onSelected: (bool selected) {
              setState(() {
                if (selected) {
                  _selectedChipIndices.add(index);
                } else {
                  _selectedChipIndices.remove(index);
                }
              });
            },
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: isSelected ? Color(0xFF3FBCB1) : Colors.grey,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(30.0),
            ),
            backgroundColor: Colors.white,
            selectedColor: Color(0xFF3FBCB1),
          );
        },
      ).toList(),
    );
  }
}
class EmojiSelector extends StatefulWidget {
  @override
  _EmojiSelectorState createState() => _EmojiSelectorState();
}

class _EmojiSelectorState extends State<EmojiSelector> {
  double _sliderValue = 0.0;
  int _selectedEmojiIndex = 0;

  final List<String> emojis = ["😡", "😌", "😐", "😀", "😄"];

  void _updateSelectedEmoji() {
    setState(() {
      _selectedEmojiIndex = (_sliderValue * 4).round();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (int i = 0; i < emojis.length; i++)
              GestureDetector(
                onTap: () {
                  setState(() {
                    _sliderValue = i / 4.0;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color:
                    _selectedEmojiIndex == i ? Color(0xFF3FBCB1) : Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    emojis[i],
                    style: TextStyle(fontSize: 30.0),
                  ),
                ),
              ),
          ],
        ),
        Slider(
          value: _sliderValue,
          onChanged: (value) {
            setState(() {
              _sliderValue = value;
              _updateSelectedEmoji();
            });
          },
          min: 0.0,
          max: 1.0,
          divisions: 4,
          activeColor: Color(0xFF3FBCB1),
        ),
        // Text(
        //   "Selected Emoji: ${emojis[_selectedEmojiIndex]}",
        //   style: TextStyle(fontSize: 24.0),
        // ),
      ],
    );
  }
}
class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 90,
      elevation: 0,
      backgroundColor: Colors.white, // White background
      leading: IconButton(
        icon: ImageIcon(AssetImage('images/back_button.png'),size: 48,), // Back icon on the left
        onPressed: () {
          // Handle back button action here

        },
      ),
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Mood Journal',
            style: TextStyle(fontSize:22.0,color: Color(0xFFA9BDBC)), // Set text color to black
          ), // Title text
          SizedBox(width: 36.0), // Adjust the width as needed
        ],
      ),
    );
  }
}