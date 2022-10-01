import 'package:flutter/material.dart';
import 'package:monews_app/asset.dart';
import 'package:monews_app/data/data.dart';

class BannerContent extends StatelessWidget {
  const BannerContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      width: 380.0,
      height: 180.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: black,
        image: const DecorationImage(
          image: AssetImage(Asset.bannerPattern1),
          repeat: ImageRepeat.repeat,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 0.0,
            child: Image.asset(
              Asset.newsListVector,
            ),
          ),
          const Positioned(
            right: 16.0,
            top: 16.0,
            child: Text(
              'خبرهایی که باید ببینید!',
              textDirection: TextDirection.rtl,
              style: TextStyle(
                color: white,
                fontFamily: 'SM',
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Positioned(
            right: 16.0,
            top: 60.0,
            child: Text(
              'نگاهی به جذاب ترین خبر های ۷ روز گذشته',
              textDirection: TextDirection.rtl,
              style: TextStyle(
                color: grey,
                fontFamily: 'SM',
                fontSize: 10,
              ),
            ),
          ),
          Positioned(
            right: 16.0,
            top: 96.0,
            child: Container(
              width: 67.0,
              height: 27.0,
              decoration: const BoxDecoration(
                color: pink,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(14.0),
                  topLeft: Radius.circular(14.0),
                  bottomRight: Radius.circular(0.0),
                  topRight: Radius.circular(14.0),
                ),
              ),
              child: const Center(
                child: Text(
                  'مشاهده',
                  style: TextStyle(
                    color: white,
                    fontFamily: 'SM',
                    fontSize: 14.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
