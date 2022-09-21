import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:instagram_clone/asset.dart';
import 'package:instagram_clone/data/model/models.dart';
import 'package:instagram_clone/widgets/custom_elevated_button.dart';

//colors
const Color transparent = Colors.transparent;
const Color black = Color(0xff1C1F2E);
const Color pink = Color(0xffF35383);
const Color white = Colors.white;
const Color blue = Colors.blue;
const Color grey = Color(0xffC5C5C5);
const Color blue2 = Color(0xff55B9F7);

//constants
final List<Content> storyList = [
  Content(imageUrl: Asset.plusIcon, borderColor: pink, profileId: '_tasbeat_'),
  Content(
      imageUrl: Asset.profilePhoto, borderColor: pink, profileId: '_tasbeat_'),
  Content(
      imageUrl: Asset.profilePhoto, borderColor: pink, profileId: '_tasbeat_'),
  Content(
      imageUrl: Asset.profilePhoto, borderColor: pink, profileId: '_tasbeat_'),
  Content(
      imageUrl: Asset.profilePhoto, borderColor: pink, profileId: '_tasbeat_'),
  Content(
      imageUrl: Asset.profilePhoto, borderColor: pink, profileId: '_tasbeat_'),
  Content(
      imageUrl: Asset.profilePhoto, borderColor: pink, profileId: '_tasbeat_'),
];

final List<Content> highlightList = [
  Content(
    imageUrl: Asset.plusIcon,
    borderColor: pink,
  ),
  Content(
    imageUrl: Asset.highlight2,
    borderColor: black,
    profileId: 'Shopping',
  ),
  Content(
    imageUrl: Asset.highlight3,
    borderColor: black,
    profileId: 'Flutter',
  ),
  Content(
    imageUrl: Asset.highlight4,
    borderColor: black,
    profileId: 'Projects',
  ),
  Content(
    imageUrl: Asset.highlight2,
    borderColor: black,
    profileId: 'Shopping',
  ),
  Content(
    imageUrl: Asset.highlight3,
    borderColor: black,
    profileId: 'Flutter',
  ),
  Content(
    imageUrl: Asset.highlight4,
    borderColor: black,
    profileId: 'Projects',
  ),
];

final List<Content> postList = [
  Content(
      postImageUrl: Asset.moonWallpaper,
      likesCounter: '2.6k',
      commentsCounter: '1k',
      isLike: false,
      isSaved: false,
      profileImageUrl: Asset.profilePhoto,
      profileId: '_tasbeat_',
      borderColor: pink,
      profileDescription: 'علی علیرحیمی'),
  Content(
      postImageUrl: Asset.moonWallpaper,
      likesCounter: '2.6k',
      commentsCounter: '1k',
      isLike: false,
      isSaved: false,
      profileImageUrl: Asset.profilePhoto,
      profileId: '_tasbeat_',
      borderColor: pink,
      profileDescription: 'علی علیرحیمی'),
  Content(
      postImageUrl: Asset.moonWallpaper,
      likesCounter: '2.6k',
      commentsCounter: '1k',
      isLike: false,
      isSaved: false,
      profileImageUrl: Asset.profilePhoto,
      profileId: '_tasbeat_',
      borderColor: pink,
      profileDescription: 'علی علیرحیمی'),
  Content(
      postImageUrl: Asset.moonWallpaper,
      likesCounter: '2.6k',
      commentsCounter: '1k',
      isLike: false,
      isSaved: false,
      profileImageUrl: Asset.profilePhoto,
      profileId: '_tasbeat_',
      borderColor: pink,
      profileDescription: 'علی علیرحیمی'),
  Content(
      postImageUrl: Asset.moonWallpaper,
      likesCounter: '2.6k',
      commentsCounter: '1k',
      isLike: false,
      isSaved: false,
      profileImageUrl: Asset.profilePhoto,
      profileId: '_tasbeat_',
      borderColor: pink,
      profileDescription: 'علی علیرحیمی'),
];
final List<Text> categoryList = [
  const Text(
    'Sport',
    style: TextStyle(color: white, fontFamily: 'GM', fontSize: 10.0),
  ),
  const Text(
    'Sport',
    style: TextStyle(color: white, fontFamily: 'GM', fontSize: 10.0),
  ),
  const Text(
    'Sport',
    style: TextStyle(color: white, fontFamily: 'GM', fontSize: 10.0),
  ),
  const Text(
    'Sport',
    style: TextStyle(color: white, fontFamily: 'GM', fontSize: 10.0),
  ),
  const Text(
    'Sport',
    style: TextStyle(color: white, fontFamily: 'GM', fontSize: 10.0),
  ),
  const Text(
    'Sport',
    style: TextStyle(color: white, fontFamily: 'GM', fontSize: 10.0),
  ),
  const Text(
    'Sport',
    style: TextStyle(color: white, fontFamily: 'GM', fontSize: 10.0),
  ),
  const Text(
    'Sport',
    style: TextStyle(color: white, fontFamily: 'GM', fontSize: 10.0),
  ),
  const Text(
    'Sport',
    style: TextStyle(color: white, fontFamily: 'GM', fontSize: 10.0),
  ),
  const Text(
    'Sport',
    style: TextStyle(color: white, fontFamily: 'GM', fontSize: 10.0),
  ),
  const Text(
    'Sport',
    style: TextStyle(color: white, fontFamily: 'GM', fontSize: 10.0),
  ),
  const Text(
    'Sport',
    style: TextStyle(color: white, fontFamily: 'GM', fontSize: 10.0),
  ),
  const Text(
    'Sport',
    style: TextStyle(color: white, fontFamily: 'GM', fontSize: 10.0),
  ),
];
final List<Content> followerList = [
  Content(
      imageUrl: Asset.followerImage1,
      borderColor: pink,
      profileId: '_tasbeat_'),
  Content(
      imageUrl: Asset.followerImage2,
      borderColor: pink,
      profileId: '_tasbeat_'),
  Content(
      imageUrl: Asset.followerImage3,
      borderColor: pink,
      profileId: '_tasbeat_'),
  Content(
      imageUrl: Asset.followerImage4,
      borderColor: pink,
      profileId: '_tasbeat_'),
  Content(
      imageUrl: Asset.followerImage5,
      borderColor: pink,
      profileId: '_tasbeat_'),
  Content(
      imageUrl: Asset.followerImage6,
      borderColor: pink,
      profileId: '_tasbeat_'),
  Content(
      imageUrl: Asset.followerImage7,
      borderColor: pink,
      profileId: '_tasbeat_'),
  Content(
      imageUrl: Asset.followerImage8,
      borderColor: pink,
      profileId: '_tasbeat_'),
  Content(
      imageUrl: Asset.followerImage1,
      borderColor: pink,
      profileId: '_tasbeat_'),
  Content(
      imageUrl: Asset.followerImage2,
      borderColor: pink,
      profileId: '_tasbeat_'),
  Content(
      imageUrl: Asset.followerImage3,
      borderColor: pink,
      profileId: '_tasbeat_'),
  Content(
      imageUrl: Asset.followerImage4,
      borderColor: pink,
      profileId: '_tasbeat_'),
  Content(
      imageUrl: Asset.followerImage5,
      borderColor: pink,
      profileId: '_tasbeat_'),
  Content(
      imageUrl: Asset.followerImage6,
      borderColor: pink,
      profileId: '_tasbeat_'),
  Content(
      imageUrl: Asset.followerImage7,
      borderColor: pink,
      profileId: '_tasbeat_'),
  Content(
      imageUrl: Asset.followerImage8,
      borderColor: pink,
      profileId: '_tasbeat_'),
  Content(
      imageUrl: Asset.followerImage1,
      borderColor: pink,
      profileId: '_tasbeat_'),
  Content(
      imageUrl: Asset.followerImage2,
      borderColor: pink,
      profileId: '_tasbeat_'),
  Content(
      imageUrl: Asset.followerImage3,
      borderColor: pink,
      profileId: '_tasbeat_'),
  Content(
      imageUrl: Asset.followerImage4,
      borderColor: pink,
      profileId: '_tasbeat_'),
  Content(
      imageUrl: Asset.followerImage5,
      borderColor: pink,
      profileId: '_tasbeat_'),
  Content(
      imageUrl: Asset.followerImage6,
      borderColor: pink,
      profileId: '_tasbeat_'),
  Content(
      imageUrl: Asset.followerImage7,
      borderColor: pink,
      profileId: '_tasbeat_'),
  Content(
      imageUrl: Asset.followerImage8,
      borderColor: pink,
      profileId: '_tasbeat_'),
];

final List<Content> exploreList = [
  Content(imageUrl: Asset.explorePhoto2),
  Content(imageUrl: Asset.explorePhoto1),
  Content(imageUrl: Asset.explorePhoto3),
  Content(imageUrl: Asset.explorePhoto4),
  Content(imageUrl: Asset.explorePhoto5),
  Content(imageUrl: Asset.explorePhoto6),
  Content(imageUrl: Asset.explorePhoto7),
  Content(imageUrl: Asset.explorePhoto8),
  Content(imageUrl: Asset.explorePhoto9),
  Content(imageUrl: Asset.explorePhoto10),
];

List<QuiltedGridTile> patternList = const [
  QuiltedGridTile(2, 1),
  QuiltedGridTile(2, 2),
  QuiltedGridTile(1, 1),
  QuiltedGridTile(1, 1),
  QuiltedGridTile(1, 1),
  QuiltedGridTile(1, 1),
  QuiltedGridTile(1, 1),
  QuiltedGridTile(1, 1),
  QuiltedGridTile(2, 2),
  QuiltedGridTile(2, 1),
  QuiltedGridTile(1, 1),
  QuiltedGridTile(1, 1),
  QuiltedGridTile(1, 1),
  QuiltedGridTile(1, 1),
  QuiltedGridTile(1, 1),
  QuiltedGridTile(1, 1),
];

List<Content> newNotificationList = [
  Content(
    profileId: '_tasbeat_',
    profileImageUrl: Asset.followerImage1,
    borderColor: pink,
    profileDescription: 'Started following you',
    time: ' 3min',
    holderWidget: _getMessageButton(),
  ),
  Content(
    profileId: '_tasbeat_',
    profileImageUrl: Asset.followerImage2,
    borderColor: pink,
    profileDescription: 'Liked your post',
    time: ' 5min',
    holderWidget: _getFollowButton(),
  ),
  Content(
    profileId: '_tasbeat_',
    profileImageUrl: Asset.followerImage3,
    borderColor: pink,
    profileDescription: 'Started following you',
    time: ' 3min',
    holderWidget: _getMessageButton(),
  ),
];

List<Content> todayNotificationList = [
  Content(
    profileId: '_tasbeat_',
    profileImageUrl: Asset.followerImage1,
    borderColor: pink,
    profileDescription: 'Started following you',
    time: ' 3min',
    holderWidget: _getMessageButton(),
  ),
  Content(
    profileId: '_tasbeat_',
    profileImageUrl: Asset.followerImage2,
    borderColor: pink,
    profileDescription: 'Liked your post',
    time: ' 5min',
    holderWidget: _getFollowButton(),
  ),
  Content(
    profileId: '_tasbeat_',
    profileImageUrl: Asset.followerImage3,
    borderColor: pink,
    profileDescription: 'Started following you',
    time: ' 3min',
    holderWidget: _getMessageButton(),
  ),
  Content(
    profileId: '_tasbeat_',
    profileImageUrl: Asset.followerImage4,
    borderColor: pink,
    profileDescription: 'Started following you',
    time: ' 3min',
    holderWidget: _getMessageButton(),
  ),
  Content(
    profileId: '_tasbeat_',
    profileImageUrl: Asset.followerImage5,
    borderColor: pink,
    profileDescription: 'Liked your post',
    time: ' 5min',
    holderWidget: _getFollowButton(),
  ),
  Content(
    profileId: '_tasbeat_',
    profileImageUrl: Asset.followerImage6,
    borderColor: pink,
    profileDescription: 'Started following you',
    time: ' 3min',
    holderWidget: _getMessageButton(),
  ),
];

List<Content> thisWeekNotificationList = [
  Content(
    profileId: '_tasbeat_',
    profileImageUrl: Asset.followerImage1,
    borderColor: pink,
    profileDescription: 'Started following you',
    time: ' 3min',
    holderWidget: _getMessageButton(),
  ),
  Content(
    profileId: '_tasbeat_',
    profileImageUrl: Asset.followerImage2,
    borderColor: pink,
    profileDescription: 'Liked your post',
    time: ' 5min',
    holderWidget: _getFollowButton(),
  ),
  Content(
    profileId: '_tasbeat_',
    profileImageUrl: Asset.followerImage3,
    borderColor: pink,
    profileDescription: 'Started following you',
    time: ' 3min',
    holderWidget: _getMessageButton(),
  ),
  Content(
    profileId: '_tasbeat_',
    profileImageUrl: Asset.followerImage4,
    borderColor: pink,
    profileDescription: 'Started following you',
    time: ' 3min',
    holderWidget: _getMessageButton(),
  ),
  Content(
    profileId: '_tasbeat_',
    profileImageUrl: Asset.followerImage5,
    borderColor: pink,
    profileDescription: 'Liked your post',
    time: ' 5min',
    holderWidget: _getFollowButton(),
  ),
  Content(
    profileId: '_tasbeat_',
    profileImageUrl: Asset.followerImage6,
    borderColor: pink,
    profileDescription: 'Started following you',
    time: ' 3min',
    holderWidget: _getMessageButton(),
  ),
  Content(
    profileId: '_tasbeat_',
    profileImageUrl: Asset.followerImage7,
    borderColor: pink,
    profileDescription: 'Started following you',
    time: ' 3min',
    holderWidget: _getMessageButton(),
  ),
  Content(
    profileId: '_tasbeat_',
    profileImageUrl: Asset.followerImage8,
    borderColor: pink,
    profileDescription: 'Liked your post',
    time: ' 5min',
    holderWidget: _getFollowButton(),
  ),
  Content(
    profileId: '_tasbeat_',
    profileImageUrl: Asset.followerImage8,
    borderColor: pink,
    profileDescription: 'Started following you',
    time: ' 3min',
    holderWidget: _getMessageButton(),
  ),
  Content(
    profileId: '_tasbeat_',
    profileImageUrl: Asset.profilePhoto,
    borderColor: pink,
    profileDescription: 'Started following you',
    time: ' 3min',
    holderWidget: _getMessageButton(),
  ),
  Content(
    profileId: '_tasbeat_',
    profileImageUrl: Asset.followerImage1,
    borderColor: pink,
    profileDescription: 'Liked your post',
    time: ' 5min',
    holderWidget: _getFollowButton(),
  ),
  Content(
    profileId: '_tasbeat_',
    profileImageUrl: Asset.followerImage5,
    borderColor: pink,
    profileDescription: 'Started following you',
    time: ' 3min',
    holderWidget: _getMessageButton(),
  ),
];

SizedBox _getMessageButton() {
  return SizedBox(
    width: 75.0,
    child: OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: white,
        side: const BorderSide(color: white, width: 2.0),
      ),
      onPressed: () {},
      child: const Text(
        'Message',
        style: TextStyle(
          color: white,
          fontFamily: 'GS',
          fontSize: 10.0,
        ),
      ),
    ),
  );
}

SizedBox _getFollowButton() {
  return SizedBox(
    width: 70.0,
    child: CustomElevatedButton(
      buttonStyle: ElevatedButton.styleFrom(
        backgroundColor: pink,
        textStyle:
            const TextStyle(color: white, fontFamily: 'GB', fontSize: 10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      buttonText: const Text('Follow'),
      onPressedFunction: () => {},
    ),
  );
}
