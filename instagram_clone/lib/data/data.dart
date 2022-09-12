import 'package:flutter/material.dart';
import 'package:instagram_clone/asset.dart';
import 'package:instagram_clone/data/model/story_content.dart';

//colors
const Color transparent = Colors.transparent;
const Color black = Color(0xff1C1F2E);
const Color pink = Color(0xffF35383);
const Color white = Colors.white;
const Color blue = Colors.blue;
const Color grey = Color(0xffC5C5C5);

//constants
final List<StoryContent> storyList = [
  StoryContent(
      imageUrl: Asset.plusIcon, borderColor: pink, profileId: '_tasbeat_'),
  StoryContent(
      imageUrl: Asset.profilePhoto, borderColor: pink, profileId: '_tasbeat_'),
  StoryContent(
      imageUrl: Asset.profilePhoto,
      borderColor: pink,
      profileId: '_tasbeat_sssss'),
  StoryContent(
      imageUrl: Asset.profilePhoto, borderColor: pink, profileId: '_tasbeat_'),
  StoryContent(
      imageUrl: Asset.profilePhoto, borderColor: pink, profileId: '_tasbeat_'),
  StoryContent(
      imageUrl: Asset.profilePhoto, borderColor: pink, profileId: '_tasbeat_'),
  StoryContent(
      imageUrl: Asset.profilePhoto, borderColor: pink, profileId: '_tasbeat_'),
];
