import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz/custom_Button.dart';
import 'package:quiz/select_question_screen.dart';
import 'package:quiz/text_widgets.dart';

enum QuizType {
  multipleChoice,
  fillInTheBlank,
  matching,
}

class QuizSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: largeText(title: 'Select Quiz Type'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(title: 'Multiple Choice Quiz', onTap: (){
              Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => QuizScreen(QuizType.multipleChoice)),
              );
            }),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
            CustomButton(title:'Fill in the Blank Quiz', onTap: (){
              Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => QuizScreen(QuizType.fillInTheBlank)),
              );
            }),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
            CustomButton(title:'Matching Quiz', onTap: (){
              Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => QuizScreen(QuizType.matching)),
              );
            }),
          ],
        ),
      ),
    );
  }
}