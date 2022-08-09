import 'package:calculator_app/constants/colors.dart';
import 'package:calculator_app/custom_widgets/elements_row_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  get blueGrey => null;
  var inputText = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _getBody(),
      ),
    );
  }

  Widget _getBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 3,
          child: Container(
            padding: EdgeInsets.all(8.0),
            color: backgroundGreyDark,
            child: Text(
              inputText,
              style: TextStyle(color: textGreen, fontSize: 26),
              textAlign: TextAlign.end,
            ),
          ),
        ),
        Expanded(
          flex: 7,
          child: Container(
            color: backgroundGrey,
            child: Column(
              children: [
                Expanded(
                  child: getRowElements(
                    firstWidget: getOperator(operator: 'ac'),
                    secondWidget: getOperator(operator: 'ce'),
                    thirdWidget: getOperator(operator: '%'),
                    fourthWidget: getOperator(operator: '/'),
                  ),
                ),
                Expanded(
                  child: getRowElements(
                    firstWidget: getNumber(number: '9'),
                    secondWidget: getNumber(number: '8'),
                    thirdWidget: getNumber(number: '7'),
                    fourthWidget: getOperator(operator: '*'),
                  ),
                ),
                Expanded(
                  child: getRowElements(
                    firstWidget: getNumber(number: '6'),
                    secondWidget: getNumber(number: '5'),
                    thirdWidget: getNumber(number: '4'),
                    fourthWidget: getOperator(operator: '+'),
                  ),
                ),
                Expanded(
                  child: getRowElements(
                    firstWidget: getNumber(number: '3'),
                    secondWidget: getNumber(number: '2'),
                    thirdWidget: getNumber(number: '1'),
                    fourthWidget: getOperator(operator: '-'),
                  ),
                ),
                Expanded(
                  child: getRowElements(
                    firstWidget: getNumber(number: '00'),
                    secondWidget: getNumber(number: '0'),
                    thirdWidget: getNumber(number: '.'),
                    fourthWidget: getOperator(operator: '='),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget getOperator({int? flex = 1, required String operator}) {
    return Expanded(
      flex: flex!,
      child: Container(
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            customBorder: CircleBorder(),
            onTap: () {
              setState(
                () {
                  if (operator == 'ce' && inputText != '') {
                    inputText = inputText.substring(0, inputText.length - 1);
                  } else {
                    inputText = inputText + operator;
                  }
                },
              );
            },
            child: Center(
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: backgroundGreyDark,
                ),
                width: 40,
                height: 40,
                child: Text(
                  operator,
                  style: TextStyle(
                    color: textGreen,
                    fontSize: 25.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget getNumber({required String number, int? flex = 1}) {
    return Expanded(
      flex: flex!,
      child: Container(
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              setState(
                () {
                  inputText = inputText + number;
                },
              );
            },
            child: Center(
              child: Text(
                number,
                style: TextStyle(
                  color: textGrey,
                  fontSize: 30.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
