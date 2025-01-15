import 'package:flutter/material.dart';

import 'package:myapp/models/quiz_model.dart';
import 'package:myapp/questions_screen.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    //create constant to receiving required value
    required this.score,
    required this.total,
    required this.questions,
    required this.selectedAnswers,
    super.key,
  });

  final int score;
  final int total;
  final List<QuizModel> questions; // ใช้ประเภทของข้อมูลคำถาม
  final List<String> selectedAnswers;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            colors: [Colors.purple, Colors.deepPurple],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "You answered $score out of $total questions correctly!",
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemCount: questions.length,
                    itemBuilder: (context, index) {
                      final question = questions[index];
                      final selectedAnswer = selectedAnswers[index];
                      final correctAnswer = question.correctAnswer;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Q${index + 1}: ${question.question}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 1),
                          Text(
                            'Your answer: $selectedAnswer',
                            style: const TextStyle(
                              color: Colors.yellow,
                            ),
                          ),
                          Text(
                            'Correct answer: $correctAnswer',
                            style: const TextStyle(color: Colors.amber),
                          ),
                          const SizedBox(height: 10,),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                OutlinedButton.icon(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const QuestionsScreen(),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.refresh,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'Restart Quiz!',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
