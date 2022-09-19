import 'package:flutter/material.dart';

class CategoryContent extends StatelessWidget {
  final List<Text> categoryList;
  const CategoryContent({Key? key, required this.categoryList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categoryList.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0),
          child: Container(
            height: 23.0,
            width: 60.0,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
              color: Color(0xff272B40),
            ),
            child: Center(
              child: categoryList[index],
            ),
          ),
        );
      },
    );
  }
}
