import 'package:ecommerce_app/constants/colors.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
          child: Container(
            width: 56.0,
            height: 56.0,
            decoration: ShapeDecoration(
              shadows: const [
                BoxShadow(
                  color: CustomColors.red,
                  blurRadius: 30,
                  spreadRadius: -6,
                  offset: Offset(0.0, 10.0),
                )
              ],
              color: CustomColors.red,
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(40.0),
              ),
            ),
            child: const Icon(
              Icons.mouse,
              color: Colors.white,
            ),
          ),
        ),
        const Text(
          'همه',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14.0,
            fontFamily: 'SB',
          ),
        ),
      ],
    );
  }
}
