import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CategoryCachedImage extends StatefulWidget {
  final String imageUrl;
  const CategoryCachedImage({super.key, required this.imageUrl});

  @override
  State<CategoryCachedImage> createState() => _CategoryCachedImageState();
}

class _CategoryCachedImageState extends State<CategoryCachedImage> {
  String imageUrl = '';
  @override
  void initState() {
    imageUrl = widget.imageUrl;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        errorWidget: (context, url, error) => Container(
          color: Colors.red[100],
        ),
        placeholder: (context, url) => Container(
          color: Colors.grey,
        ),
      ),
    );
  }
}
