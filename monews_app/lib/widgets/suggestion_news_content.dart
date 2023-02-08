import 'package:flutter/material.dart';

import 'package:monews_app/asset.dart';
import 'package:monews_app/data/data.dart';
import 'package:monews_app/data/models/content.dart';

class SuggestionNewsContent extends StatelessWidget {
  final List<Content> suggestionNewsList;
  final int index;
  const SuggestionNewsContent({
    Key? key,
    required this.suggestionNewsList,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: SizedBox(
        width: 380.0,
        height: 145.0,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.asset(
                        suggestionNewsList[index].imageUrl,
                      ),
                    ),
                    Positioned(
                      top: 5.0,
                      right: 5.0,
                      child: Container(
                        height: 28.0,
                        width: 58.0,
                        decoration: BoxDecoration(
                          color: pink.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Center(
                          child: Text(
                            suggestionNewsList[index].catergories[0],
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
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      RichText(
                        softWrap: true,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: suggestionNewsList[index].shortDescription,
                              style: const TextStyle(
                                fontFamily: 'SM',
                                color: black,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 6.0),
                        child: RichText(
                          softWrap: true,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: suggestionNewsList[index].longDescription,
                                style: const TextStyle(
                                  fontFamily: 'SM',
                                  color: grey,
                                  fontSize: 7.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 12.0, left: 6.0, right: 6.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 4.0),
                              child: Image.asset(
                                suggestionNewsList[index].agencyLogoUrl,
                                width: 15.0,
                                height: 15.0,
                              ),
                            ),
                            Text(
                              suggestionNewsList[index].agency,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
