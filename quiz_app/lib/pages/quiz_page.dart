import 'package:flutter/material.dart';
import 'package:quiz_app/constants/Constants.dart';

class QuizPage extends StatefulWidget {
  QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  var questions = getQuestions();
  var questionIndex = 0;
  int? selectedIndex = 0;
  var isAnswerSelected = false;
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
      appBar: AppBar(
        title: Text('Quiz Night'),
        centerTitle: true,
        backgroundColor: Colors.indigo[900],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [_getQuestionTitle(), _getQuestionImage(), _getAnswers()],
          ),
        ),
      ),
    );
  }

  Widget _getQuestionTitle() {
    return ListTile(
      subtitle: Text(
        'سوال  1',
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
      image: AssetImage('images/1.png'),
      height: 200.0,
    );
  }

  Widget _getAnswers() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          ...List.generate(
            4,
            (index) => Padding(
              padding: EdgeInsets.only(bottom: 3),
              child: ListTile(
                selected: index == selectedIndex,
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                subtitle: Text(
                  stringListOfAnswerTitleOrders[index],
                  style: TextStyle(fontSize: 10),
                  textAlign: TextAlign.end,
                ),
                dense: true,
                title: Text(
                  questions[questionIndex].answers[index],
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    color:
                        selectedIndex == questions[questionIndex].correctAnswer
                            ? trueAnswerColor
                            : Colors.black,
                  ),
                ),
                trailing: Icon(Icons.question_answer_rounded),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (selectedIndex ==
                        questions[questionIndex].correctAnswer) {
                      selectedIndex = null;
                      trueAnswerColor = Colors.green;
                    } else {
                      trueAnswerColor = Colors.green;
                    }
                  });
                },
                child: Text('ارسال جواب'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('تایید جواب'),
              )
            ],
          )
        ],
      ),
    );
  }
}
