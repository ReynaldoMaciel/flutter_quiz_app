import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({
    super.key,
    required this.summaryData,
  });

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
            children: summaryData.map((data) {
          final bool answeredCorrectly =
              data['correct_answer'] == data['user_answer'];

          return Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, bottom: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        answeredCorrectly ? Colors.blue[400] : Colors.red[200],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(13),
                    child: Text(
                      ((data['question_index'] as int) + 1).toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['question'] as String,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        data['user_answer'] as String,
                        style: const TextStyle(color: Colors.grey),
                      ),
                      Text(
                        data['correct_answer'] as String,
                        style: TextStyle(color: Colors.blue[300]),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        }).toList()),
      ),
    );
  }
}
