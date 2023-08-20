import 'package:flutter/material.dart';
import 'package:quiz_app/data/ques.dart';
import 'package:quiz_app/first_page.dart';
import 'package:quiz_app/questions_dart.dart';
import 'package:quiz_app/res_page.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  String curState = 'front';
  changeState() {
    setState(() {
      curState = 'quiz';
    });
  }

  List<String> selectedAns = [];
  void addAns(String ans) {
    selectedAns.add(ans);
    if (selectedAns.length == questions.length) {
      setState(
        () {
          curState = 'result';
        },
      );
    }
  }

  void restart() {
    setState(() {
      curState = 'quiz';
      selectedAns = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screen = FrontPage(changeState);

    if (curState == 'quiz') {
      screen = QuestionsPage(addAns);
    } else if (curState == 'result') {
      screen = ResPage(selectedAns, restart);
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 92, 29, 200),
                Color.fromARGB(255, 159, 30, 184),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screen,
        ),
      ),
    );
  }
}
