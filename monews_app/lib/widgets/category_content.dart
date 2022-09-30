import 'package:flutter/material.dart';
import 'package:monews_app/data/data.dart';

class CategoryContent extends StatelessWidget {
  final int currentCategorySelectedIndex;
  final int index;
  const CategoryContent({
    super.key,
    required this.currentCategorySelectedIndex,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 14.0),
      width: 53.0,
      decoration: BoxDecoration(
        color: currentCategorySelectedIndex == index ? pink2 : Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: const Center(
        child: Text('همه'),
      ),
    );
  }
}
