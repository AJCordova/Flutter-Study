

class Question {

  late String questionText;
  late bool questionAnswer;

  //Question(this.questionText, this.questionAnswer);
  Question({required String questionText, required bool questionAnswer}) {
    this.questionText = questionText;
    this.questionAnswer = questionAnswer;
  }
}