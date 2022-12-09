import 'package:ecommerce_app/constants/asset.dart';
import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundScreenColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 44, right: 44, bottom: 32),
              child: Container(
                height: 46,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 16,
                    ),
                    Image.asset(Asset.appleIconBlue),
                    const Expanded(
                      child: Text(
                        'حساب کاربری',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'sb',
                            fontSize: 16,
                            color: CustomColors.blue),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const Text(
              'علی علیرحیمی',
              style: TextStyle(fontFamily: 'sb', fontSize: 16),
            ),
            const Text(
              '09215622680',
              style: TextStyle(fontFamily: 'sm', fontSize: 10),
            ),
            const SizedBox(
              height: 30,
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Wrap(
                spacing: 20,
                runSpacing: 20,
                children: const [
                  CategoryItem(),
                  CategoryItem(),
                  CategoryItem(),
                  CategoryItem(),
                  CategoryItem(),
                  CategoryItem(),
                  CategoryItem(),
                  CategoryItem(),
                  CategoryItem(),
                  CategoryItem(),
                ],
              ),
            ),
            const Spacer(),
            const Text(
              'اپل شاپ',
              style: TextStyle(
                  fontFamily: 'SM', fontSize: 10, color: CustomColors.grey),
            ),
            const Text('v-1.0.00',
                style: TextStyle(
                    fontFamily: 'SM', fontSize: 10, color: CustomColors.grey)),
            const Text('Instagram.com/_tasbeat',
                style: TextStyle(
                    fontFamily: 'SM', fontSize: 10, color: CustomColors.grey))
          ],
        ),
      ),
    );
  }
}
