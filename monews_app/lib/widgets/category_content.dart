import 'package:flutter/material.dart';
import 'package:monews_app/data/data.dart';
import 'package:monews_app/data/models/content.dart';

class CategoryContent extends StatelessWidget {
  final int currentCategorySelectedIndex;
  final int index;
  final List<Content> categoryList;
  const CategoryContent(
      {super.key,
      required this.currentCategorySelectedIndex,
      required this.index,
      required this.categoryList});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 14.0),
      width: 53.0,
      decoration: BoxDecoration(
        color: currentCategorySelectedIndex == index ? pink2 : Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Center(
        child: Text(
          categoryList[index].catergories[0],
          style: const TextStyle(
            color: black,
            fontFamily: 'SM',
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
