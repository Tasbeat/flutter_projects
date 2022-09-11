import 'package:flutter/material.dart';
import 'package:instagram_clone/data/data.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            width: screenSize.width,
            height: 80.0,
            child: ListView.builder(
              itemCount: storyList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  width: 64.0,
                  height: 64.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    border: Border.all(
                      width: 3.0,
                      color: storyList[index].borderColor,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
