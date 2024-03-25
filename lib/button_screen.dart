import 'package:flutter/material.dart';
import 'package:quiz/data_screen.dart';
import 'package:quiz/question_screen.dart';


class BottomScreen extends StatefulWidget {
  const BottomScreen({super.key});



  @override
  State<BottomScreen> createState() => _BottomScreenState();
}

class _BottomScreenState extends State<BottomScreen> {
  int indexx = 0;
  List<Widget> screens= [
    QuizSelectionScreen(),
    DataScreen(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[indexx],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: indexx,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 14.0,
          unselectedFontSize: 10.0,
          selectedIconTheme: IconThemeData(color: Colors.red),
          unselectedIconTheme: IconThemeData(color: Colors.orangeAccent),
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black54,
          onTap: (index) {
            indexx = index;
            setState(() {});
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Quiz '),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Info'),

          ],
        )
    );
  }
}
