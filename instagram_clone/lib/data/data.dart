import 'package:flutter/material.dart';
import 'package:instagram_clone/asset.dart';
import 'package:instagram_clone/data/model/models.dart';

//colors
const Color transparent = Colors.transparent;
const Color black = Color(0xff1C1F2E);
const Color pink = Color(0xffF35383);
const Color white = Colors.white;
const Color blue = Colors.blue;
const Color grey = Color(0xffC5C5C5);

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
