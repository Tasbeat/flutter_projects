import 'package:bmi_calc/constants/colors.dart';
import 'package:bmi_calc/custom_widgets/left_progress_bar.dart';
import 'package:bmi_calc/custom_widgets/right_progress_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var resultBMI = 0.0;
  var resultText = '';
  var resultColor = Colors.transparent;
  var healthyProgressBarWidth = 150.0;
  var unHealthyProgressBarWidth = 150.0;
  final weightFieldTextController = TextEditingController();
  final heightFieldTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _getAppBar(),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 40.0),
        _getTextFields(),
        SizedBox(height: 40.0),
        _getCalcButton(),
        SizedBox(height: 40.0),
        _getResultText(),
        SizedBox(height: 40.0),
        _getUserBMIResultText(),
        SizedBox(height: 40.0),
        _getProgressBars(),
      ],
    );
  }

  Widget _getUserBMIResultText() {
    return Text(
      '$resultText',
      style: TextStyle(color: resultColor, fontSize: 30.0),
    );
  }

  Widget _getProgressBars() {
    return Column(
      children: [
        RightProgressBar(
          height: 30.0,
          width: unHealthyProgressBarWidth,
        ),
        SizedBox(height: 10.0),
        LeftProgressBar(
          height: 30.0,
          width: healthyProgressBarWidth,
        )
      ],
    );
  }

  Widget _getResultText() {
    return Text(
      '${resultBMI.toStringAsFixed(2)}',
      style: TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _getCalcButton() {
    return InkWell(
      onTap: () {
        if (weightFieldTextController.text == '' ||
            heightFieldTextController.text == '' ||
            heightFieldTextController.text.contains('.') == false) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Enter True Height Or Weight"),
            ),
          );
        } else {
          var weightDouble = double.parse(weightFieldTextController.text);
          var heightDouble = double.parse(heightFieldTextController.text);
          setState(
            () {
              resultBMI = weightDouble / (heightDouble * heightDouble);
              if (resultBMI >= 25) {
                resultText = 'فراتر از استاندارد';
                resultColor = red;
                unHealthyProgressBarWidth = 270;
                healthyProgressBarWidth = 50;
              } else if (resultBMI <= 24.9 && resultBMI >= 18.5) {
                resultText = 'مطابق با استاندارد';
                resultColor = green;
                unHealthyProgressBarWidth = 50;
                healthyProgressBarWidth = 270;
              } else if (resultBMI < 18.5) {
                resultText = 'کمتر از استاندارد';
                resultColor = black;
                unHealthyProgressBarWidth = 80;
                healthyProgressBarWidth = 80;
              }
            },
          );
        }
      },
      child: Text(
        textDirection: TextDirection.rtl,
        'محاسبه کن !',
        style: TextStyle(
          color: black,
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _getTextFields() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: 80.0,
          child: TextField(
            cursorColor: Colors.black,
            controller: heightFieldTextController,
            style: TextStyle(color: black, fontSize: 20.0),
            maxLength: 4,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              fillColor: Colors.black,
              iconColor: Colors.black,
              focusColor: Colors.black,
              hoverColor: Colors.black,
              prefixIconColor: Colors.black,
              suffixIconColor: Colors.black,
              hintText: 'قد',
              icon: Icon(Icons.height),
              hintStyle: TextStyle(
                color: black.withOpacity(0.3),
              ),
            ),
          ),
        ),
        Container(
          width: 80.0,
          child: TextField(
            controller: weightFieldTextController,
            style: TextStyle(color: black, fontSize: 20.0),
            textAlign: TextAlign.center,
            maxLength: 3,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'وزن',
              icon: Icon(Icons.fastfood),
              hintStyle: TextStyle(
                color: black.withOpacity(0.3),
              ),
            ),
          ),
        ),
      ],
    );
  }

  PreferredSizeWidget _getAppBar() {
    return AppBar(
      backgroundColor: Colors.lightBlue,
      elevation: 0,
      title: Text(
        'BMI محاسبه ',
        style: TextStyle(color: black),
      ),
      centerTitle: true,
    );
  }
}
