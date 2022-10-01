import 'package:flutter/material.dart';
import 'package:monews_app/asset.dart';
import 'package:monews_app/data/data.dart';

class HotNewsContent extends StatelessWidget {
  const HotNewsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5.0),
      child: SizedBox(
        width: 255.0,
        height: 294.0,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 0.0, left: 4.0, right: 4.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.asset(
                        Asset.newsImage1,
                        width: 240.0,
                        height: 150.0,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 18.0,
                    right: 14.0,
                    child: Container(
                      height: 28.0,
                      width: 58.0,
                      decoration: BoxDecoration(
                        color: pink.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: const Center(
                        child: Text(
                          'ورزشی',
                          style: TextStyle(
                            color: white,
                            fontSize: 10.0,
                            fontFamily: 'SM',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 12.0, left: 14.0, right: 14.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: Image.asset(Asset.flashCircle),
                    ),
                    const Text(
                      'پیشنهاد مونیوز',
                      style: TextStyle(
                        color: grey,
                        fontSize: 10.0,
                        fontFamily: 'SM',
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      '5 دقیقه پیش',
                      style: TextStyle(
                        color: grey,
                        fontSize: 10.0,
                        fontFamily: 'SM',
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 3.0),
                child: RichText(
                  softWrap: true,
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text:
                            'پاسخ منفی پورتو به چلسی برای جذب طارمی با طعم تهدید!',
                        style: TextStyle(
                          fontFamily: 'SM',
                          color: black,
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 20.0, left: 14.0, right: 14.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: Image.asset(Asset.akharinKhabarLogo),
                    ),
                    const Text(
                      'خبرگذاری آخرین خبر',
                      style: TextStyle(
                        color: black,
                        fontSize: 8.0,
                        fontFamily: 'SM',
                      ),
                    ),
                    const Spacer(),
                    Image.asset(Asset.shortMenuIcon)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
