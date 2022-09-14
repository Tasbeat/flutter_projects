import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:instagram_clone/asset.dart';
import 'package:instagram_clone/data/data.dart';
import 'package:instagram_clone/data/model/models.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
        actions: [Image.asset(Asset.directIcon)],
        leadingWidth: 130.0,
      ),
      body: Column(
        children: [
          SizedBox(
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
                          index == 0
                              ? 'Your Story'
                              : storyList[index].profileId,
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
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: postList.length,
                    itemBuilder: (context, index) {
                      PostContent alreadyPostContent = postList[index];
                      return Column(
                        children: [
                          _getPostHeader(index, alreadyPostContent),
                          Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              const SizedBox(
                                height: 400.0,
                              ),
                              Image.asset(alreadyPostContent.postImageUrl),
                              Positioned(
                                bottom: 10.0,
                                child: ClipRRect(
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: const [
                                          Padding(
                                            padding:
                                                EdgeInsets.only(left: 10.0),
                                            child: Icon(Icons.comment),
                                          ),
                                          Icon(Icons.comment),
                                          Icon(Icons.comment),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(right: 10.0),
                                            child: Icon(Icons.comment),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ],
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
            width: 3.0,
            color: index == 0 ? white : storyList[index].borderColor,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(10.0),
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
