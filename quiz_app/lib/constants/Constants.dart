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
  var question3 = Question(
      answers: ['(شوروی سابق)روسیه', 'آمریکا', 'چین', 'هند'],
      correctAnswer: 2,
      questionNumber: 3,
      questionTitle: 'چه کشوری ایستگاه فضایی میر را بنا کرد؟');
  var question4 = Question(
      answers: ['(شوروی سابق)روسیه', 'آمریکا', 'چین', 'هند'],
      correctAnswer: 2,
      questionNumber: 4,
      questionTitle: 'چه کشوری ایستگاه فضایی میر را بنا کرد؟');
  var question5 = Question(
      answers: ['(شوروی سابق)روسیه', 'آمریکا', 'چین', 'هند'],
      correctAnswer: 2,
      questionNumber: 5,
      questionTitle: 'چه کشوری ایستگاه فضایی میر را بنا کرد؟');
  var question6 = Question(
      answers: ['(شوروی سابق)روسیه', 'آمریکا', 'چین', 'هند'],
      correctAnswer: 2,
      questionNumber: 6,
      questionTitle: 'چه کشوری ایستگاه فضایی میر را بنا کرد؟');
  var question7 = Question(
      answers: ['(شوروی سابق)روسیه', 'آمریکا', 'چین', 'هند'],
      correctAnswer: 2,
      questionNumber: 7,
      questionTitle: 'چه کشوری ایستگاه فضایی میر را بنا کرد؟');
  var question8 = Question(
      answers: ['(شوروی سابق)روسیه', 'آمریکا', 'چین', 'هند'],
      correctAnswer: 2,
      questionNumber: 8,
      questionTitle: 'چه کشوری ایستگاه فضایی میر را بنا کرد؟');
  var question9 = Question(
      answers: ['(شوروی سابق)روسیه', 'آمریکا', 'چین', 'هند'],
      correctAnswer: 2,
      questionNumber: 9,
      questionTitle: 'چه کشوری ایستگاه فضایی میر را بنا کرد؟');
  questionList.add(question1);
  questionList.add(question2);
  questionList.add(question3);
  questionList.add(question4);
  questionList.add(question5);
  questionList.add(question6);
  questionList.add(question7);
  questionList.add(question8);
  questionList.add(question9);

  return questionList;
}
