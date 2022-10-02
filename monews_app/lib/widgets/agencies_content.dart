import 'package:flutter/material.dart';
import 'package:monews_app/data/data.dart';

import '../data/models/content.dart';

class AgenciesContent extends StatelessWidget {
  final List<Content> agenciesList;
  final int index;
  const AgenciesContent(
      {super.key, required this.agenciesList, required this.index});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 133.0,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Image.asset(
                agenciesList[index].agencyLogoUrl,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                agenciesList[index].agency,
                style: const TextStyle(
                  color: black,
                  fontFamily: 'SM',
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 6.0),
              width: 100.0,
              height: 30.0,
              decoration: BoxDecoration(
                color: pink2,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: const Center(
                child: Text(
                  'دنبال کردن',
                  style: TextStyle(
                    color: pink,
                    fontFamily: 'SM',
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
