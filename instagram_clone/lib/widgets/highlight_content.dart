import 'package:flutter/material.dart';
import 'package:instagram_clone/data/model/models.dart';

import '../data/data.dart';

class HighlightContent extends StatelessWidget {
  final List<Content> highlightList;
  const HighlightContent({Key? key, required this.highlightList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: highlightList.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Column(
          children: [
            const SizedBox(
              height: 5.0,
            ),
            _getStoryAccountElement(index, 64.0, 64.0),
            const SizedBox(
              height: 1.0,
            ),
            SizedBox(
              width: 55.0,
              child: Flexible(
                child: Text(
                  index == 0 ? 'New' : highlightList[index].profileId,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Padding _getStoryAccountElement(int index, double width, double height) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 5.0,
      ),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(17.0),
          ),
          border: Border.all(
            width: 2.0,
            color: index == 0 ? white : highlightList[index].borderColor,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(13.0),
            ),
            child: Image(
              image: AssetImage(
                highlightList[index].imageUrl,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
