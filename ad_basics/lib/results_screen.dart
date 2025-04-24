import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ad_basics/data/questions.dart';
import 'package:ad_basics/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.chosenAnswers, required this.onRestart});

  final List<String> chosenAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }
    return summary;
  }
  // use getter instead of method when there are no parameters
  //
  // List<Map<String, Object>> get summaryData {
  //   final List<Map<String, Object>> summary = [];

  //   for (var i = 0; i < chosenAnswers.length; i++) {
  //     summary.add({
  //       'question_index': i,
  //       'question': questions[i].text,
  //       'correct_answer': questions[i].answers[0],
  //       'user_answer': chosenAnswers[i],
  //     });
  //   }
  //   return summary;
  // }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectAnswers = summaryData
        .where((data) => data['user_answer'] == data['correct_answer'])
        .length;

    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectAnswers out of $numTotalQuestions questions correctly!',
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 220, 157, 219),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            QuestionsSummary(summaryData),
            SizedBox(height: 30),
            TextButton.icon(
              onPressed: onRestart,
              style: OutlinedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                foregroundColor: Colors.white,
              ),
              icon: const Icon(
                Icons.refresh,
                size: 24,
                color: Colors.white,
              ),
              label: const Text('Restart Quiz!'),
            ),
          ],
        ),
      ),
    );
  }
}
