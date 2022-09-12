import 'dart:ui';

class PostContent {
  String likesCounter;
  String commentsCounter;
  bool isLike;
  bool isSaved;
  String profileImageUrl;
  String profileId;
  Color borderColor;
  String postImageUrl;
  String profileDescription;

  PostContent({
    required this.borderColor,
    required this.postImageUrl,
    required this.likesCounter,
    required this.commentsCounter,
    required this.isLike,
    required this.isSaved,
    required this.profileImageUrl,
    required this.profileId,
    required this.profileDescription,
  });
}
