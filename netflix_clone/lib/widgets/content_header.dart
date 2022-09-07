import 'package:flutter/material.dart';
import 'package:netflix_clone/models/models.dart';
import 'package:netflix_clone/widgets/widgets.dart';
import 'package:video_player/video_player.dart';

class ContentHeader extends StatelessWidget {
  final Content featuredContent;
  const ContentHeader({Key? key, required this.featuredContent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: _MobileContentHeader(
        featuredContent: featuredContent,
      ),
      desktop: _DesktopContentHeader(
        featuredContent: featuredContent,
      ),
    );
  }
}

class _MobileContentHeader extends StatelessWidget {
  final Content featuredContent;
  const _MobileContentHeader({Key? key, required this.featuredContent})
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
          bottom: 75.0,
          left: 120.0,
          right: 120.0,
          child: SizedBox(
            height: 150.0,
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
              _playElevatedButton('Play', Icons.play_arrow_outlined),
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
}

class _DesktopContentHeader extends StatefulWidget {
  final Content featuredContent;

  const _DesktopContentHeader({Key? key, required this.featuredContent})
      : super(key: key);

  @override
  State<_DesktopContentHeader> createState() => __DesktopContentHeaderState();
}

class __DesktopContentHeaderState extends State<_DesktopContentHeader> {
  Content? featuredContent;
  late VideoPlayerController _videoPlayerController;
  bool isMutedSoundOfVideo = true;
  @override
  void initState() {
    featuredContent = widget.featuredContent;

    _videoPlayerController =
        VideoPlayerController.network(featuredContent!.videoUrl)
          ..initialize().then((_) => setState(() {}))
          ..setVolume(0)
          ..play();
    super.initState();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _videoPlayerController.value.isPlaying
            ? _videoPlayerController.pause()
            : _videoPlayerController.play();
      },
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          AspectRatio(
            aspectRatio: _videoPlayerController.value.isInitialized
                ? _videoPlayerController.value.aspectRatio
                : 2.344,
            child: _videoPlayerController.value.isInitialized
                ? VideoPlayer(_videoPlayerController)
                : Image.asset(
                    featuredContent!.imageUrl,
                    fit: BoxFit.cover,
                  ),
          ),
          Positioned(
            bottom: -1,
            left: 0,
            right: 0,
            child: AspectRatio(
              aspectRatio: _videoPlayerController.value.isInitialized
                  ? _videoPlayerController.value.aspectRatio
                  : 2.344,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.transparent,
                        Colors.black
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0, 0.25, 0.89]),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 120.0,
            left: 40.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 130.0,
                  width: 400.0,
                  child: Image.asset(featuredContent!.titleImageUrl),
                ),
                SizedBox(
                  height: 120.0,
                  child: Text(
                    featuredContent!.description,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                              color: Colors.black,
                              offset: Offset(2.0, 4.0),
                              blurRadius: 6.0)
                        ]),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _playElevatedButton('Play', Icons.play_arrow),
                    const SizedBox(width: 20.0),
                    _playElevatedButton('More Info', Icons.info),
                    const SizedBox(width: 20.0),
                    if (_videoPlayerController.value.isInitialized)
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isMutedSoundOfVideo
                                ? _videoPlayerController.setVolume(100)
                                : _videoPlayerController.setVolume(0);
                            isMutedSoundOfVideo =
                                _videoPlayerController.value.volume == 0;
                          });
                        },
                        icon: Icon(
                          isMutedSoundOfVideo
                              ? Icons.volume_off
                              : Icons.volume_down,
                          size: 30.0,
                          color: Colors.white,
                        ),
                      )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

ElevatedButton _playElevatedButton(String text, IconData icon) {
  return ElevatedButton.icon(
    style: ElevatedButton.styleFrom(primary: Colors.white),
    icon: Icon(
      icon,
      color: Colors.black,
    ),
    label: Text(
      text,
      style: const TextStyle(color: Colors.black),
    ),
    onPressed: () => print('play button'),
  );
}
