import 'package:flutter/material.dart';
import 'package:monews_app/asset.dart';
import 'package:monews_app/data/data.dart';

class SuggestionNewsContent extends StatelessWidget {
  const SuggestionNewsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: SizedBox(
        width: 380.0,
        height: 120.0,
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
                        Asset.suggestionNewsPhoto1,
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
                        child: const Center(
                          child: Text(
                            'تکنولوژی',
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
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      RichText(
                        softWrap: true,
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  'سـاعـت هوشـمـنـد گــارمـیـن Venu Sq 2 بـا عمر باتری ۱۱ روزه معرفی شد',
                              style: TextStyle(
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
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    'گارمین در رویداد IFA ۲۰۲۲ ساعت هوشمند Venu Sq 2 و ردیاب سلامت کودکان موسوم به Black Panther Vivofit Jr 3 را معرفی کرد.',
                                style: TextStyle(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
