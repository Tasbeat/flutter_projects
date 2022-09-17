import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/asset.dart';
import 'package:instagram_clone/data/data.dart';
import 'package:instagram_clone/data/model/models.dart';
import 'package:instagram_clone/navigator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isPostLiked = false;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: black,
      appBar: AppBar(
        backgroundColor: black,
        elevation: 0.0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Image.asset(Asset.moodinegarLogo),
        ),
        actions: [
          Image.asset(Asset.directIcon),
        ],
        leadingWidth: 130.0,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: _getElevatedButton(context),
          ),
          SliverToBoxAdapter(
            child: _getStories(screenSize),
          ),
          _getPosts(),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 30.0,
            ),
          )
        ],
      ),
    );
  }

  ElevatedButton _getElevatedButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showModalBottomSheet(
          barrierColor: transparent,
          backgroundColor: transparent,
          isScrollControlled: true,
          context: context,
          builder: (context) => makeDismissible(
            child: _getDraggableScrollableSheet(),
          ),
        );
      },
      style: Theme.of(context).elevatedButtonTheme.style,
      child: const Text('Open Bottom Sheet'),
    );
  }

  DraggableScrollableSheet _getDraggableScrollableSheet() {
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
                    child: Column(
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
                        _getHeaderOfBottomSheet(),
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
                    ),
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

  Padding _getHeaderOfBottomSheet() {
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
          AccountContent shareFollower = followerList[index];
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
      ),
    );
  }

  Widget makeDismissible({required Widget child}) => GestureDetector(
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

  SliverList _getPosts() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          PostContent alreadyPostContent = postList[index];
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

  Padding _getPostElement(PostContent alreadyPostContent) {
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
                      SvgPicture.asset(
                        Asset.sendIcon,
                        color: white,
                        semanticsLabel: 'send',
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 7.0),
                        child: SvgPicture.asset(
                          Asset.savedIcon,
                          color: white,
                          semanticsLabel: 'save',
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

  SizedBox _getStories(Size screenSize) {
    return SizedBox(
      width: screenSize.width,
      height: 100.0,
      child: ListView.builder(
        itemCount: storyList.length,
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
                    index == 0 ? 'Your Story' : storyList[index].profileId,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  ListTile _getPostHeader(int index, PostContent alreadyPostContent) {
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
            color: index == 0 ? white : storyList[index].borderColor,
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
                storyList[index].imageUrl,
              ),
            ),
          ),
        ),
      ),
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
}
