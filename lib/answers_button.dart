import 'package:flutter/material.dart';
import 'package:myapp/data/quiz.dart';

class AnswersButton extends StatelessWidget {
  AnswersButton(this.answerOption, this.onPressed,{super.key});

  //define callBackFunciton and send answerOption to QuestionsScreen
  final void Function(String) onPressed;
  final String answerOption;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(answerOption),
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 9, 0, 78)),
      child: Text(
        answerOption,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
