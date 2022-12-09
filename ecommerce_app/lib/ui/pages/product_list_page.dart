import 'package:ecommerce_app/constants/asset.dart';
import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundScreenColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, bottom: 32),
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
                          'پرفروش ترین ها',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'sb',
                            fontSize: 16,
                            color: CustomColors.blue,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  ((context, index) {
                    return const ProductCard();
                  }),
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 2.5,
                  mainAxisSpacing: 30,
                  crossAxisSpacing: 30,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
