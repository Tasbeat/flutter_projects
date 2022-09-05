import 'package:flutter/material.dart';

import '../models/models.dart';

class OtherContent extends StatelessWidget {
  final String title;
  final List<Content> otherContentList;
  final bool isOriginalsContentList;
  const OtherContent(
      {Key? key,
      required this.title,
      required this.otherContentList,
      this.isOriginalsContentList = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: isOriginalsContentList ? 500.0 : 220.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: otherContentList.length,
              itemBuilder: ((context, index) {
                return GestureDetector(
                  onTap: () => print(otherContentList[index].name),
                  child: Container(
                    height: isOriginalsContentList ? 400.0 : 200.0,
                    width: isOriginalsContentList ? 200.0 : 130.0,
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(otherContentList[index].imageUrl),
                          fit: BoxFit.cover),
                    ),
                  ),
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
