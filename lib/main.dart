import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

//In flutter we only have to control what ends up on the screen
void main() {
  //Using runApp because it has been provided by material.dart
  runApp(MyApp());
}

//Here extends means inheritance
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    //State here means that it should return a state
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  final questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answerText': [
        {'text': 'Black', 'score': 1},
        {'text': 'Red', 'score': 0},
        {'text': 'Blue', 'score': 0},
        {'text': 'Green', 'score': 0}
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answerText': [
        {'text': 'Lion', 'score': 1},
        {'text': 'Jackal', 'score': 0},
        {'text': 'Panther', 'score': 0},
        {'text': 'Elephant', 'score': 0}
      ],
    },
    {
      'questionText': 'Who\'s your favorite character from The Office?',
      'answerText': [
        {'text': 'Michael', 'score': 0},
        {'text': 'James', 'score': 0},
        {'text': 'Pamela', 'score': 0},
        {'text': 'Dwight', 'score': 1}
      ],
    }
  ];
  var questionIndex = 0;
  var totalScore = 0;

  void resetQuiz() {
    setState(() {
      questionIndex = 0;
      totalScore = 0;
    });
  }

  //Functions defined inside are called methods
  void answerQuestion(int score) {
    //Setstate is the function that forces flutter to re-render the
    //Setstate calls the build method
    //It updates the widget
    totalScore = totalScore + score;
    setState(() {
      questionIndex++;
    });
    print(questionIndex);
    // print('Button has been clicked !');

    if (questionIndex < questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  //Functions defined outside are functions XD
  @override
  Widget build(BuildContext context) {
    //The above widget returns a Widget

    return MaterialApp(
      //Removing the debug manner
      debugShowCheckedModeBanner: false,
      //Material App has arguments by name
      home: Scaffold(
        appBar: AppBar(
          title: Text('Get ready to be questioned'),
        ),
        body: questionIndex < questions.length
            ? Quiz(
                answerQuestion: answerQuestion,
                questionIndex: questionIndex,
                questions: questions,
              )
            : Result(totalScore, resetQuiz),
      ),
    );
  }
}
