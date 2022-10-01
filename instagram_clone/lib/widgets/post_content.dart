import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/asset.dart';
import 'package:instagram_clone/data/data.dart';
import 'package:instagram_clone/data/model/models.dart';
import 'package:instagram_clone/navigator.dart';
import 'package:instagram_clone/widgets/widgets.dart';

import '../pages/pages.dart';

class PostContent extends StatefulWidget {
  final postList;
  const PostContent({Key? key, required this.postList}) : super(key: key);

  @override
  State<PostContent> createState() => _PostContentState();
}

class _PostContentState extends State<PostContent> {
  late List<Content> postList;
  @override
  void initState() {
    postList = widget.postList;
    super.initState();
  }

  bool isPostLiked = false;
  bool isPostSaved = false;
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          Content alreadyPostContent = postList[index];
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _getPostHeader(index, alreadyPostContent),
              _getPostElement(alreadyPostContent),
            ],
          );
        },
        childCount: postList.length,
      ),
    );
  }

  Padding _getPostElement(Content alreadyPostContent) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          const SizedBox(
            height: 400.0,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image.asset(alreadyPostContent.postImageUrl),
          ),
          Positioned(
            bottom: 40.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 5.0,
                  sigmaY: 5.0,
                ),
                child: Container(
                  width: 310.0,
                  height: 40.0,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                    gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(
                          255,
                          255,
                          255,
                          0.5,
                        ),
                        Color.fromRGBO(
                          255,
                          255,
                          255,
                          0.2,
                        ),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 7.0,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              if (isPostLiked) {
                                isPostLiked = false;
                              } else {
                                isPostLiked = true;
                              }
                            });
                          },
                          child: SvgPicture.asset(
                            Asset.likeIcon,
                            color: isPostLiked ? pink : white,
                            semanticsLabel: 'like',
                          ),
                        ),
                      ),
                      Text(
                        ' ${alreadyPostContent.likesCounter}',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      const Spacer(),
                      SvgPicture.asset(
                        Asset.commentIcon,
                        color: white,
                        semanticsLabel: 'comment',
                      ),
                      Text(
                        ' ${alreadyPostContent.commentsCounter}',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            barrierColor: transparent,
                            backgroundColor: transparent,
                            isScrollControlled: true,
                            context: context,
                            builder: (context) => _makeDismissible(
                              child: _getDraggableScrollableSheet(),
                            ),
                          );
                        },
                        child: SvgPicture.asset(
                          Asset.sendIcon,
                          color: white,
                          semanticsLabel: 'send',
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 7.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              if (isPostSaved) {
                                isPostSaved = false;
                              } else {
                                isPostSaved = true;
                              }
                            });
                          },
                          child: SvgPicture.asset(
                            Asset.savedIcon,
                            color: isPostSaved ? pink : white,
                            semanticsLabel: 'like',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  ListTile _getPostHeader(int index, Content alreadyPostContent) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
      leading: _getPostListTileLeading(index, 44.0, 44.0),
      title: Text(
        alreadyPostContent.profileId,
        style: const TextStyle(
          color: white,
          fontSize: 12.0,
          fontFamily: 'GB',
        ),
      ),
      subtitle: Text(
        alreadyPostContent.profileDescription,
        style: const TextStyle(
          color: white,
          fontSize: 12.0,
          fontFamily: 'SM',
        ),
      ),
      trailing: Image.asset(Asset.moreIcon),
    );
  }

  Container _getPostListTileLeading(int index, double width, double height) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(13.0),
        ),
        border: Border.all(
          width: 2.0,
          color: postList[index].borderColor,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(10.0),
          ),
          child: Image(
            image: AssetImage(
              postList[index].profileImageUrl,
            ),
          ),
        ),
      ),
    );
  }

  Widget _makeDismissible({required Widget child}) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          print('Hit Test');
          navigator(
              context: context,
              destinationPage: const HomePage(),
              isPush: false);
        },
        child: GestureDetector(
          onTap: () {
            print('Hit Child');
          },
          child: child,
        ),
      );
  CustomButtomSheet _getDraggableScrollableSheet() {
    return CustomButtomSheet(followerList: followerList);
  }
}
