import 'package:ecommerce_app/constants/asset.dart';
import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/ui/pages/pages.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
            builder: (BuildContext context) => const ProductDetailScreen()),
      ),
      child: Container(
        width: 140.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Image.asset(
                    Asset.iphone,
                    height: 90.0,
                    width: 140,
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Image.asset(Asset.activeFavProduct),
                ),
                Positioned(
                  bottom: 2.0,
                  left: 10.0,
                  child: Container(
                    height: 13.0,
                    width: 20.0,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: const Center(
                      child: Text(
                        '%5',
                        style: TextStyle(
                          fontSize: 10.0,
                          fontFamily: 'SB',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 5.0, right: 10.0),
              child: Text(
                'آیفون 13 پرو',
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 10.0,
                  fontFamily: 'SM',
                  color: CustomColors.grey,
                ),
              ),
            ),
            const Spacer(),
            Container(
              height: 35.0,
              decoration: const BoxDecoration(
                color: CustomColors.blue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0),
                ),
              ),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: Image.asset(
                        Asset.rightArrowCircleIcon,
                        width: 25,
                      ),
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        Text(
                          '۵۰/۰۰۰/۰۰',
                          style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            decorationColor: Colors.black,
                            fontSize: 10.0,
                            fontFamily: 'SM',
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '۴۸/۸۰۰/۰۰',
                          style: TextStyle(
                            fontSize: 12.0,
                            fontFamily: 'SM',
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: Text(
                        'تومان',
                        style: TextStyle(
                          fontSize: 12.0,
                          fontFamily: 'SB',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
