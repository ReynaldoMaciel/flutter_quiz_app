import 'package:adv_basics/questions_summary.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.chosenAnswers, required this.onTapRestart});

  final List<String> chosenAnswers;
  final void Function() onTapRestart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswers[i],
        },
      );
    }
    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final int totalQuestions = questions.length;
    final int totalCorrectQuestions = summaryData
        .where((data) => data['correct_answer'] == data['user_answer'])
        .length;

    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Text(
            'You answered $totalCorrectQuestions out of $totalQuestions question correctly!',
            style: GoogleFonts.lato(
              color: const Color.fromARGB(154, 255, 255, 255),
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      const SizedBox(height: 30),
      QuestionsSummary(
        summaryData: summaryData,
      ),
      const SizedBox(height: 30),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: onTapRestart,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Transform.flip(
                    flipX: true,
                    child: const Icon(
                      Icons.replay,
                      textDirection: TextDirection.ltr,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Restart Quiz',
                    style: GoogleFonts.lato(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ]);
  }
}
