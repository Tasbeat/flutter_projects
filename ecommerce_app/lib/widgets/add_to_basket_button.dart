import 'dart:ui';

import 'package:ecommerce_app/constants/colors.dart';
import 'package:flutter/material.dart';

class AddToBasketButton extends StatelessWidget {
  const AddToBasketButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Positioned(
          child: Container(
            height: 60,
            width: 140,
            decoration: const BoxDecoration(
              color: CustomColors.blue,
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
          ),
        ),
        Positioned(
          child: ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: const SizedBox(
                height: 53,
                width: 160,
                child: Center(
                  child: Text(
                    'افزودن سبد خرید',
                    style: TextStyle(
                        fontFamily: 'sb', fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
