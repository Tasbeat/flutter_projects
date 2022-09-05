import 'package:flutter/material.dart';
import 'package:netflix_clone/models/models.dart';

class PreviewContents extends StatelessWidget {
  final String title;
  final List<Content> previewsContentList;
  const PreviewContents(
      {Key? key, required this.title, required this.previewsContentList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
          height: 165.0,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: previewsContentList.length,
              itemBuilder: ((context, index) {
                return Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(15.0),
                      height: 130.0,
                      width: 130.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image:
                                AssetImage(previewsContentList[index].imageUrl),
                            fit: BoxFit.cover),
                        border: Border.all(
                            width: 4.0,
                            color: previewsContentList[index].color),
                      ),
                    ),
                  ],
                );
              })),
        )
      ],
    );
  }
}
