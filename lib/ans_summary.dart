import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnsSummary extends StatelessWidget {
  const AnsSummary(this.summary, {super.key});

  final List<Map<String, Object>> summary;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: summary.map(
            (data) {
              return Row(
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: data['crktans'] == data['chosenans']
                          ? Colors.blue
                          : Colors.pink,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      ((data['index'] as int) + 1).toString(),
                      style: GoogleFonts.lato(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          (data['question'] as String),
                          style: GoogleFonts.lato(
                              color: Colors.white, fontSize: 15),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          (data['crktans'] as String),
                          style: GoogleFonts.lato(
                            color: const Color.fromARGB(255, 227, 53, 186),
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          (data['chosenans'] as String),
                          style: GoogleFonts.lato(
                            color: Colors.lightBlue,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  )
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
