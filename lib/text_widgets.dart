import 'package:flutter/material.dart';



Widget largeText ({title , double fontSize = 18.0, FontWeight fontWeight = FontWeight.bold,Color color = Colors.white}){
  return Text(title,style: TextStyle(fontSize: fontSize,fontWeight: fontWeight,color: color),);
}



Widget normalText ({title , double fontSize = 14.0, FontWeight fontWeight = FontWeight.w500,Color color = Colors.white}){
  return Text(title,style: TextStyle(fontSize: fontSize,fontWeight: fontWeight,color: color),);
}