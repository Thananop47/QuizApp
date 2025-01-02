import 'package:flutter/material.dart';
import 'package:myapp/answers_button.dart';
import 'package:myapp/data/quiz.dart';
import 'package:myapp/result_screen.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  State<QuestionsScreen> createState() => _QuestionsState();
}

class _QuestionsState extends State<QuestionsScreen> {
  var questionIndex = 0;
  var score = 0;

  List<String> selectedAnswer = [];

  //create Function handlerAnswer for check selectedAnswer and check condition for update score
  void handleAnswer(String selectedValue) {
    selectedAnswer.add(selectedValue);
    if (selectedValue == questions[questionIndex].correctAnswer) {
      setState(
        () {
          score++;
        },
      );
    }
    if (questionIndex < questions.length - 1) {
      setState(() {
        questionIndex++;
      });
    } else { 
      Navigator.push(
        context,
        MaterialPageRoute( // send all required value to resultScreen
          builder: (context) => ResultScreen(
              score: score,
              total: questions.length,
              questions: questions,
              selectedAnswers: selectedAnswer),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[questionIndex];
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple, Colors.deepPurple],
            ),
          ),
          child: Center(
            child: Container(
              margin: const EdgeInsets.all(40),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    currentQuestion.question,
                    style: const TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ...currentQuestion.answers.map((answer) {
                    return AnswersButton(answer, handleAnswer);
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
