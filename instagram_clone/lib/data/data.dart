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
final List<AccountContent> storyList = [
  AccountContent(
      imageUrl: Asset.plusIcon, borderColor: pink, profileId: '_tasbeat_'),
  AccountContent(
      imageUrl: Asset.profilePhoto, borderColor: pink, profileId: '_tasbeat_'),
  AccountContent(
      imageUrl: Asset.profilePhoto,
      borderColor: pink,
      profileId: '_tasbeat_sssss'),
  AccountContent(
      imageUrl: Asset.profilePhoto, borderColor: pink, profileId: '_tasbeat_'),
  AccountContent(
      imageUrl: Asset.profilePhoto, borderColor: pink, profileId: '_tasbeat_'),
  AccountContent(
      imageUrl: Asset.profilePhoto, borderColor: pink, profileId: '_tasbeat_'),
  AccountContent(
      imageUrl: Asset.profilePhoto, borderColor: pink, profileId: '_tasbeat_'),
];

final List<PostContent> postList = [
  PostContent(
      postImageUrl: Asset.postImage,
      likesCounter: '2.6k',
      commentsCounter: '1k',
      isLike: false,
      isSaved: false,
      profileImageUrl: Asset.profilePhoto,
      profileId: 'profileId',
      borderColor: pink,
      profileDescription: 'امیراحمد برنامه‌نویس موبایل'),
  PostContent(
      postImageUrl: Asset.postImage,
      likesCounter: '2.6k',
      commentsCounter: '1k',
      isLike: false,
      isSaved: false,
      profileImageUrl: Asset.profilePhoto,
      profileId: 'profileId',
      borderColor: pink,
      profileDescription: 'امیراحمد برنامه‌نویس موبایل'),
  PostContent(
      postImageUrl: Asset.postImage,
      likesCounter: '2.6k',
      commentsCounter: '1k',
      isLike: false,
      isSaved: false,
      profileImageUrl: Asset.profilePhoto,
      profileId: 'profileId',
      borderColor: pink,
      profileDescription: 'امیراحمد برنامه‌نویس موبایل'),
  PostContent(
      postImageUrl: Asset.postImage,
      likesCounter: '2.6k',
      commentsCounter: '1k',
      isLike: false,
      isSaved: false,
      profileImageUrl: Asset.profilePhoto,
      profileId: 'profileId',
      borderColor: pink,
      profileDescription: 'امیراحمد برنامه‌نویس موبایل'),
  PostContent(
      postImageUrl: Asset.postImage,
      likesCounter: '2.6k',
      commentsCounter: '1k',
      isLike: false,
      isSaved: false,
      profileImageUrl: Asset.profilePhoto,
      profileId: 'profileId',
      borderColor: pink,
      profileDescription: 'امیراحمد برنامه‌نویس موبایل'),
];
