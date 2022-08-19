import 'package:quiz_app/data/Question.dart';

List<Question> getQuestions() {
  List<Question> questionList = [];
  var question1 = Question(
      answers: ['زکریای رازی', 'دیوید کاپرفیلد', 'هری هودینی', 'دیوید بلین'],
      correctAnswer: 2,
      questionNumber: 1,
      questionTitle: 'مشهور ترین شعبده‌باز جهان کیست؟');

  var question2 = Question(
      answers: ['(شوروی سابق)روسیه', 'آمریکا', 'چین', 'هند'],
      correctAnswer: 2,
      questionNumber: 2,
      questionTitle: 'چه کشوری ایستگاه فضایی میر را بنا کرد؟');
  questionList.add(question1);
  questionList.add(question2);

  return questionList;
}
