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
                return GestureDetector(
                  onTap: () => print(previewsContentList[index].name),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(15.0),
                        height: 130.0,
                        width: 130.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage(
                                  previewsContentList[index].imageUrl),
                              fit: BoxFit.cover),
                          border: Border.all(
                            width: 4.0,
                            color: previewsContentList[index].color,
                          ),
                        ),
                      ),
                      Container(
                        height: 130.0,
                        width: 130.0,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              Colors.black45,
                              Colors.black87
                            ],
                            stops: [0, 0.25, 1],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                      Positioned(
                          left: 0.0,
                          right: 0.0,
                          bottom: 0.0,
                          child: SizedBox(
                            height: 60.0,
                            child: Image.asset(
                                previewsContentList[index].titleImageUrl),
                          ))
                    ],
                  ),
                );
              })),
        )
      ],
    );
  }
}
