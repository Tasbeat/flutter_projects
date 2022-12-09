import 'package:ecommerce_app/constants/colors.dart';
import 'package:flutter/material.dart';

import '../constants/asset.dart';

class HeaderTitle extends StatelessWidget {
  const HeaderTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
        child: Row(
          children: [
            Image.asset(Asset.leftCategotyIcon),
            const SizedBox(
              width: 8.0,
            ),
            const Text(
              'مشاهده همه',
              style: TextStyle(
                  color: CustomColors.blue, fontFamily: 'SB', fontSize: 12),
            ),
            const Spacer(),
            const Text(
              'پر فروشترین ها',
              style: TextStyle(
                  color: CustomColors.grey, fontFamily: 'SB', fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
