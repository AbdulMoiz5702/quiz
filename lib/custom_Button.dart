import 'package:flutter/material.dart';
import 'package:quiz/text_widgets.dart';



class CustomButton extends StatelessWidget {
  const CustomButton({required this.title,required this.onTap});
  final VoidCallback onTap ;
  final String title ;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onTap,
      splashColor: Colors.deepPurple,
      highlightColor: Colors.pinkAccent,
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          height: MediaQuery.sizeOf(context).height * 0.05,
          width: MediaQuery.sizeOf(context).width * 0.6,
          decoration: BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(child: normalText(title: title,),),
        ),
      ),
    );
  }
}
