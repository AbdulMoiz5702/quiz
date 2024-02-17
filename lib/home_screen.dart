import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz/custom_Button.dart';
import 'package:quiz/question_screen.dart';
import 'package:quiz/text_widgets.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: largeText(title: 'Vocabulary Quiz'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(title:'Start Quiz', onTap: (){
              Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => QuizSelectionScreen()),
              );
            }),
          ],
        ),
      ),
    );
  }
}