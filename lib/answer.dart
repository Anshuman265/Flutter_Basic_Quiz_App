import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function functionHandler; //Declaring the property of our class
  final String answerText;

  const Answer(this.functionHandler, this.answerText); //Our constructor
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.purple, //Styling our elevated button
        ),
        child: Text(answerText),
        /*Was not working without parentheses */
        //Anonymous function needs to be used
        onPressed: () => functionHandler(),
        /* 
        functionHandler returns a Future and onPressed accepts void, 
        which is why you can't directly assign Navigator.push to onPressed,
        however when you do onPressed: () =>  You're simply executing Navigator.push(...) 
        inside the callback provided by
        onPressed. Hope that explained! 
        */
      ),
    );
  }
}
