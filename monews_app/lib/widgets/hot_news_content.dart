import 'package:flutter/material.dart';
import 'package:monews_app/asset.dart';
import 'package:monews_app/data/data.dart';

import '../data/models/content.dart';

class HotNewsContent extends StatelessWidget {
  final List<Content> hotNewsList;
  final int index;
  const HotNewsContent(
      {super.key, required this.hotNewsList, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5.0),
      child: SizedBox(
        width: 255.0,
        height: 290.0,
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
                        hotNewsList[index].imageUrl,
                        width: 240.0,
                        height: 130.0,
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
                      child: Center(
                        child: Text(
                          hotNewsList[index].catergories[0],
                          style: const TextStyle(
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
                      'Monews Recommended',
                      style: TextStyle(
                        color: grey,
                        fontSize: 10.0,
                        fontFamily: 'SM',
                      ),
                    ),
                    const Spacer(),
                    Text(
                      hotNewsList[index].reportTime,
                      style: const TextStyle(
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
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: hotNewsList[index].shortDescription,
                        style: const TextStyle(
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
                      child: Image.asset(
                        hotNewsList[index].agencyLogoUrl,
                      ),
                    ),
                    Text(
                      hotNewsList[index].agency,
                      style: const TextStyle(
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
