import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz/images.dart';
import 'package:quiz/question_screen.dart';




class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed( const Duration(seconds: 4),(){
      Navigator.push(context, CupertinoPageRoute(builder: (context)=> QuizSelectionScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Container(
          height: MediaQuery.sizeOf(context).height * 0.5,
          width: MediaQuery.sizeOf(context).width * 0.9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image:const  DecorationImage(image: AssetImage(image),isAntiAlias: true,fit: BoxFit.cover,),
          ),
        ),
      ),
    );
  }
}
