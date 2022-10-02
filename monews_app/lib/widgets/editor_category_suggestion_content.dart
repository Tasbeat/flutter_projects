import 'package:flutter/material.dart';

import '../data/data.dart';
import '../data/models/content.dart';

class EditorCategorySuggestionContent extends StatelessWidget {
  final List<Content> editorCategorySuggestionList;
  final int index;
  const EditorCategorySuggestionContent({
    Key? key,
    required this.editorCategorySuggestionList,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 0.0, left: 4.0, right: 4.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset(
                    editorCategorySuggestionList[index].imageUrl,
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
                  child: Center(
                    child: Text(
                      editorCategorySuggestionList[index].catergories[0],
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
        ],
      ),
    );
  }
}
