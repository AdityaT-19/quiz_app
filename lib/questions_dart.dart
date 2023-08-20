import 'package:flutter/material.dart';
import 'package:quiz_app/ans_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'data/ques.dart';

class QuestionsPage extends StatefulWidget {
  const QuestionsPage(this.addAns, {super.key});
  final void Function(String ans) addAns;
  @override
  State<StatefulWidget> createState() {
    return _QuestionsState();
  }
}

class _QuestionsState extends State<QuestionsPage> {
  var curQIndex = 0;
  void updateQues(String ans) {
    widget.addAns(ans); //allows us to access the members of widget above
    setState(() {
      curQIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final curQues = questions[curQIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              curQues.ques,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 251, 208, 252),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...curQues.shuffledops.map((op) {
              return AnsButton(op, () {
                updateQues(op);
              });
            })
          ],
        ),
      ),
    );
  }
}
