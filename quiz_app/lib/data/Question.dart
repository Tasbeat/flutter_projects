class Question {
  var questionTitle;
  var questionNumber;
  var correctAnswer;
  var answers = [];

  Question(
      {required this.answers,
      required this.correctAnswer,
      required this.questionNumber,
      required this.questionTitle});
}
