import 'package:flutter/material.dart';
import 'package:netflix_clone/models/models.dart';
import 'package:netflix_clone/widgets/widgets.dart';

class ContentHeader extends StatelessWidget {
  final Content featuredContent;
  const ContentHeader({Key? key, required this.featuredContent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 450.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(featuredContent.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: 450.0,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.transparent, Colors.transparent, Colors.black],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0, 0.25, 0.89]),
          ),
        ),
        Positioned(
          bottom: 85.0,
          left: 50.0,
          right: 50.0,
          child: SizedBox(
            child: Image.asset(featuredContent.titleImageUrl),
          ),
        ),
        Positioned(
          bottom: 40.0,
          left: 0.0,
          right: 0.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              VerticalIconButton(
                buttonIcon: Icons.add,
                text: 'List',
                color: Colors.white,
                onTap: () => print('List'),
              ),
              _playElevatedButton(),
              VerticalIconButton(
                buttonIcon: Icons.info_outline,
                text: 'Info',
                color: Colors.white,
                onTap: () => print('Info'),
              ),
            ],
          ),
        )
      ],
    );
  }

  ElevatedButton _playElevatedButton() {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(primary: Colors.white),
      icon: const Icon(
        Icons.play_arrow,
        color: Colors.black,
      ),
      label: const Text(
        'Play',
        style: TextStyle(color: Colors.black),
      ),
      onPressed: () => print('play button'),
    );
  }
}
