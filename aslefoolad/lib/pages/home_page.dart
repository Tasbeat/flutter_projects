import 'package:aslefoolad/asset.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../data/data.dart';
import '../widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _scrollController;
  double _scrollOffset = 0.0;
  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _scrollOffset = _scrollController.offset;
        });
      });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(
          screenSize.width,
          60.0,
        ),
        child: SafeArea(
          child: CustomAppBar(scrollOffset: _scrollOffset),
        ),
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: Stack(
              children: [
                CarouselWithIndicatorDemo(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CarouselWithIndicatorDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

List<Widget> myList = [
  Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(headerContent.imageUrl),
        fit: BoxFit.cover,
      ),
    ),
  ),
  Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(headerContent.imageUrl),
        fit: BoxFit.cover,
      ),
    ),
  ),
  Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(headerContent.imageUrl),
        fit: BoxFit.cover,
      ),
    ),
  ),
  Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(headerContent.imageUrl),
        fit: BoxFit.cover,
      ),
    ),
  ),
  Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(headerContent.imageUrl),
        fit: BoxFit.cover,
      ),
    ),
  ),
];
var imgList = [
  Asset.headerPicture,
  Asset.headerPicture,
  Asset.headerPicture,
  Asset.headerPicture,
  Asset.headerPicture,
  Asset.headerPicture
];

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffffd51f),
      height: 350,
      width: 400,
      child: Column(children: [
        const SizedBox(height: 85.0),
        Expanded(
          child: CarouselSlider(
            items: myList,
            carouselController: _controller,
            options: CarouselOptions(
                autoPlay: false,
                enlargeCenterPage: true,
                aspectRatio: 1.5,
                height: 500.0,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.easeInQuad,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
      ]),
    );
  }
}
