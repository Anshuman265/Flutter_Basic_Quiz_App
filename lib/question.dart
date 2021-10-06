import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  //Creating the property
  final Map
      questionMap; //Adding final before it to tell dart that it wont be changed again
  //Constructor with positional argument
  //For name argument you can enclose it in curly braces
  Question(this.questionMap);
  @override
  Widget build(BuildContext context) {
    final String questionText = questionMap['questionText'];
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        questionText,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}
