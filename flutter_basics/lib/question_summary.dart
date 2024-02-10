import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: CircleAvatar(
                    backgroundColor: (data['correct_answer'] == data['user_answer']) ? Colors.green.shade200 : Colors.red.shade200,
                    child: Center(
                      child: Text(((data['question_index'] as int) + 1).toString(), style: const TextStyle(fontSize: 16, color: Colors.white)),
                    ),
                  )
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['question'] as String,
                        style: const TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      const SizedBox(height: 5),
                      Text(data['user_answer'] as String, textAlign: TextAlign.start, style: const TextStyle(fontSize: 12, color: Colors.blue),),
                      Text(data['correct_answer'] as String, textAlign: TextAlign.start, style: const TextStyle(fontSize: 12, color: Colors.black)),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
