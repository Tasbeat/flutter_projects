import 'package:ecommerce_app/constants/asset.dart';
import 'package:ecommerce_app/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(Asset.appleIconBlue),
          ),
          Expanded(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: _getAppBarSearchTextField(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(Asset.searchIcon),
          )
        ],
      ),
    );
  }

  TextField _getAppBarSearchTextField() {
    return const TextField(
      autofocus: false,
      cursorColor: CustomColors.grey,
      style: TextStyle(
        color: CustomColors.grey,
        fontSize: 14,
        fontFamily: 'GM',
      ),
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 10.0),
        hintText: 'جستجوی محصولات',
        hintStyle: TextStyle(
          color: CustomColors.grey,
          fontFamily: 'SB',
          fontSize: 12,
        ),
        labelStyle: TextStyle(
          color: CustomColors.grey,
          fontFamily: 'SB',
          fontSize: 14,
        ),
        border: UnderlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              15.0,
            ),
          ),
          borderSide: BorderSide(
            width: 3,
            color: Colors.red,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              15.0,
            ),
          ),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              15.0,
            ),
          ),
          borderSide: BorderSide(
            width: 3,
            color: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
