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
            color: blueGreyColor,
          ),
        ),
        Expanded(
          flex: 7,
          child: Container(
            color: blueColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: getThreeRowElements(
                      firstElement: 9,
                      secondElement: 8,
                      thirdElement: 7,
                      fourthElement: '+'),
                ),
                Expanded(
                  child: getThreeRowElements(
                      firstElement: 6,
                      secondElement: 5,
                      thirdElement: 4,
                      fourthElement: '-'),
                ),
                Expanded(
                  child: getThreeRowElements(
                      firstElement: 3,
                      secondElement: 2,
                      thirdElement: 1,
                      fourthElement: '*'),
                ),
                Expanded(
                  child: getLastRowElements(),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
