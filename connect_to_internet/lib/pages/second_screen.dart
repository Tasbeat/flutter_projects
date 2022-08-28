import 'package:flutter/material.dart';

import '../data/model/User.dart';

class SecondScreen extends StatefulWidget {
  List<User>? userList;
  SecondScreen({Key? key, this.userList}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  List<User>? userList;
  @override
  void initState() {
    super.initState();
    userList = widget.userList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
              ...List.generate(
                10,
                (index) => Text(userList![index].name),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
