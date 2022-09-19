import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/asset.dart';

import '../data/data.dart';
import '../data/model/content.dart';

class CustomButtomSheet extends StatelessWidget {
  final List<Content> followerList;
  const CustomButtomSheet({Key? key, required this.followerList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.5,
      minChildSize: 0.3,
      maxChildSize: 0.7,
      builder: (context, scrollController) => ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Container(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0),
              ),
              color: white.withOpacity(0.5),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
              ),
              child: CustomScrollView(
                controller: scrollController,
                slivers: [
                  SliverToBoxAdapter(
                    child: _getBottomSheetHeader(),
                  ),
                  _getBottomSheetGridContent(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column _getBottomSheetHeader() {
    return Column(
      children: [
        const SizedBox(height: 10.0),
        Container(
          height: 5.0,
          width: 46.0,
          decoration: const BoxDecoration(
            color: white,
            borderRadius: BorderRadius.all(
              Radius.circular(100.0),
            ),
          ),
        ),
        const SizedBox(height: 10.0),
        _getTitleOfBottomSheet(),
        const SizedBox(height: 10.0),
        Container(
          height: 46.0,
          width: 340.0,
          decoration: BoxDecoration(
            color: white.withOpacity(0.4),
            borderRadius: BorderRadius.circular(13),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: SvgPicture.asset(
                  Asset.exploreIcon,
                  color: white,
                ),
              ),
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 15.0),
      ],
    );
  }

  Padding _getTitleOfBottomSheet() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            'Share',
            style: TextStyle(
              color: white,
              fontSize: 24.0,
              fontFamily: 'GB',
            ),
          ),
          Image(
            image: AssetImage(Asset.shareIcon),
          ),
        ],
      ),
    );
  }

  SliverGrid _getBottomSheetGridContent() {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        childCount: followerList.length,
        (context, index) {
          Content shareFollower = followerList[index];
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                shareFollower.imageUrl,
                width: 60.0,
                height: 60.0,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    shareFollower.profileId,
                    style: const TextStyle(
                      fontFamily: 'GB',
                      fontSize: 12.0,
                      color: white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          );
        },
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 20.0,
        crossAxisSpacing: 8.0,
        mainAxisExtent: 90.0,
      ),
    );
  }
}
