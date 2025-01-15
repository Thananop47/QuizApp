class QuizModel {
  String question;
  List<String> answers;
  String correctAnswer;

  //swap answer
  List<String> getShuffledAnswers() {
    final shuffleAnswers = List.of(answers);

    shuffleAnswers.shuffle();
    return shuffleAnswers;
  }

  QuizModel(this.question, this.answers, this.correctAnswer);
}
