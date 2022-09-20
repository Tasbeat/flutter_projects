import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:instagram_clone/asset.dart';
import 'package:instagram_clone/data/data.dart';

class Content {
  String likesCounter;
  String commentsCounter;
  bool isLike;
  bool isSaved;
  String profileImageUrl;
  String profileId;
  Color borderColor;
  String postImageUrl;
  String profileDescription;
  String imageUrl;
  String time;
  Widget? holderWidget;
  Content({
    this.borderColor = pink,
    this.postImageUrl = Asset.startLogo,
    this.likesCounter = '',
    this.commentsCounter = '',
    this.isLike = false,
    this.isSaved = false,
    this.profileImageUrl = Asset.profilePhoto,
    this.profileId = '',
    this.profileDescription = '',
    this.imageUrl = Asset.miniLogo,
    this.time = '',
    this.holderWidget,
  });
}
