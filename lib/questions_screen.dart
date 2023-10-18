import 'package:adv_basics/answer_button.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      // currentQuestionIndex = currentQuestionIndex.index + 1;
      // currentQuestionIndex += 1;
      if (currentQuestionIndex != questions.length) {
        currentQuestionIndex++;
      }
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(38),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text(
            currentQuestion.text,
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(158, 255, 255, 255),
              fontSize: 22,
            ),
          ),
          const SizedBox(height: 25),
          ...currentQuestion.shuffledAnswers.map((answer) {
            return AnswerButton(
              text: answer,
              onTap: () {
                answerQuestion(answer);
              },
            );
          }),
        ]),
      ),
    );
  }
}
