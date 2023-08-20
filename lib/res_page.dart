import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/ans_summary.dart';
import 'package:quiz_app/data/ques.dart';

class ResPage extends StatelessWidget {
  const ResPage(this.selectedAns, this.Restart, {super.key});
  final List<String> selectedAns;
  final void Function() Restart;

  List<Map<String, Object>> getSummary() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < selectedAns.length; i++) {
      summary.add(
        {
          'index': i,
          'question': questions[i].ques,
          'crktans': questions[i].options[0],
          'chosenans': selectedAns[i],
        },
      );
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summary = getSummary();
    final totalQuesNo = questions.length;
    final crktAnsNo =
        summary.where((data) => data['crktans'] == data['chosenans']).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(
          40,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You answered $crktAnsNo out of $totalQuesNo questions correctly!",
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            AnsSummary(summary),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: Restart,
              icon: const Icon(Icons.refresh),
              label: const Text('Restart Quiz !'),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
