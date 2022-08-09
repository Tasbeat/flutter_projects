import 'package:calculator_app/constants/colors.dart';
import 'package:calculator_app/custom_widgets/elements_row_widget.dart';
import 'package:flutter/material.dart';

import '../custom_widgets/number_widget.dart';
import '../custom_widgets/operator_widget.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  get blueGrey => null;

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
      children: [
        Expanded(
          flex: 3,
          child: Container(
            color: backgroundGreyDark,
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
                    firstWidget: getOperator('ac'),
                    secondWidget: getOperator('ce'),
                    thirdWidget: getOperator('%'),
                    fourthWidget: getOperator('/'),
                  ),
                ),
                Expanded(
                  child: getRowElements(
                    firstWidget: getNumber('9'),
                    secondWidget: getNumber('8'),
                    thirdWidget: getNumber('7'),
                    fourthWidget: getOperator('*'),
                  ),
                ),
                Expanded(
                  child: getRowElements(
                    firstWidget: getNumber('6'),
                    secondWidget: getNumber('5'),
                    thirdWidget: getNumber('4'),
                    fourthWidget: getOperator('+'),
                  ),
                ),
                Expanded(
                  child: getRowElements(
                    firstWidget: getNumber('3'),
                    secondWidget: getNumber('2'),
                    thirdWidget: getNumber('1'),
                    fourthWidget: getOperator('-'),
                  ),
                ),
                Expanded(
                  child: getRowElements(
                    firstWidget: getNumber('00'),
                    secondWidget: getNumber('0'),
                    thirdWidget: getOperator('.'),
                    fourthWidget: getOperator('='),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
