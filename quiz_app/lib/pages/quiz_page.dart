import 'package:flutter/material.dart';
import 'package:quiz_app/constants/Constants.dart';
import 'package:quiz_app/navigator.dart';
import 'package:quiz_app/pages/result_page.dart';

class QuizPage extends StatefulWidget {
  QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  var questions = getQuestions();
  var questionIndex = 0;
  int? selectedIndex = 0;
  int questionNumberTitle = 1;
  var isAnswerSelected = false;
  bool isUserHasPermissionToSelect = true;
  var isAnswerHasSubmitted = false;
  var userCorrectAnswersNumber = 0;
  var userWrongAnswersNumber = 0;
  var submitText = 'سوال بعدی';
  var trueAnswerColor;
  var wrongAnswerColor;
  var stringListOfAnswerTitleOrders = [
    'گزینه اول',
    'گزینه دوم',
    'گزینه سوم',
    'گزینه چهارم'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [_getQuestionTitle(), _getQuestionImage(), _getAnswers()],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _getAppBar() {
    return AppBar(
      title: Text('Quiz Night'),
      centerTitle: true,
      backgroundColor: Colors.indigo[900],
    );
  }

  Widget _getQuestionTitle() {
    return ListTile(
      subtitle: Text(
        'سوال $questionNumberTitle از ${questions.length}  ',
        textAlign: TextAlign.end,
      ),
      dense: true,
      title: Text(
        questions[questionIndex].questionTitle,
        style: TextStyle(fontSize: 16),
        textAlign: TextAlign.end,
      ),
      trailing: Icon(Icons.quiz),
    );
  }

  Widget _getQuestionImage() {
    return Image(
      image:
          AssetImage('images/${questions[questionIndex].questionNumber}.png'),
      height: 200.0,
    );
  }

  Widget _getAnswers() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          ...List.generate(4, (index) => _getListTile(index)),
          _getButtons()
        ],
      ),
    );
  }

  Widget _getButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          onPressed: () {
            setState(() {
              if (isAnswerHasSubmitted) return;
              isUserHasPermissionToSelect = false;
              if (selectedIndex == questions[questionIndex].correctAnswer) {
                trueAnswerColor = Colors.green;
                userCorrectAnswersNumber++;
                isAnswerHasSubmitted = true;
              } else {
                wrongAnswerColor = Colors.red;
                userWrongAnswersNumber++;
                isAnswerHasSubmitted = true;
              }
            });
          },
          child: Text('ارسال جواب'),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary:
                  questionIndex == questions.length - 1 ? Colors.red : null),
          onPressed: () {
            setState(() {
              if (questionIndex == questions.length - 1) {
                if (isAnswerHasSubmitted) {
                  navigator(
                    context,
                    ResultPage(
                      userCorrectAnswersNumber:
                          userCorrectAnswersNumber.toString(),
                      userWrongAnswersNumber: userWrongAnswersNumber.toString(),
                    ),
                  );
                  return;
                } else {
                  return;
                }
              }

              isUserHasPermissionToSelect = true;
              isAnswerHasSubmitted = false;
              trueAnswerColor = null;
              wrongAnswerColor = null;
              questionNumberTitle++;
              questionIndex++;
            });
          },
          child: Text(
            questionIndex == questions.length - 1 ? 'نتیجه' : 'سوال بعدی',
          ),
        )
      ],
    );
  }

  Widget _getListTile(int index) {
    return Padding(
      padding: EdgeInsets.only(bottom: 3),
      child: ListTile(
        selected: index == selectedIndex,
        onTap: () {
          setState(() {
            if (!isUserHasPermissionToSelect) return;
            selectedIndex = index;
          });
        },
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        subtitle: Text(
          stringListOfAnswerTitleOrders[index],
          style: TextStyle(
            fontSize: 10,
            color: getSelectedAnswerColor(index),
          ),
          textAlign: TextAlign.end,
        ),
        dense: true,
        title: Text(
          questions[questionIndex].answers[index],
          textAlign: TextAlign.end,
          style: TextStyle(
            color: getSelectedAnswerColor(index),
          ),
        ),
        trailing: Icon(Icons.question_answer_rounded),
      ),
    );
  }

  Color? getSelectedAnswerColor(int index) {
    if (index == selectedIndex &&
        selectedIndex == questions[questionIndex].correctAnswer) {
      return trueAnswerColor;
    } else if (selectedIndex == index) {
      return wrongAnswerColor;
    } else
      return null;
  }
}
