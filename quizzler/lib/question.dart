class Question {
  String questionText;
  bool questionAnswer;

  Question(String question, bool answer) {
    this.questionText = question;
    this.questionAnswer = answer;
  }

  bool checkIfCorrect(bool userAnswer){
    return userAnswer == this.questionAnswer;
  }

}
