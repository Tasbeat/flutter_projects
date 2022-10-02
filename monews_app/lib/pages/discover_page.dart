import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marquee/marquee.dart';
import 'package:monews_app/data/data.dart';
import 'package:monews_app/widgets/widgets.dart';

import '../asset.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  int _currentCategorySelectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(Asset.monewsLogo),
        backgroundColor: white,
        elevation: 0.0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(Asset.searchIcon),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(Asset.filterEditIcon),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: white,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              _getCarouselSlider(),
              _getCategoryList(),
              _getNewsTitle(more: 'مشاهده بیشتر', title: 'خبرگذاری ها'),
              _getAgenciesContentList(),
              _getNewsTitle(more: 'مشاهده بیشتر', title: 'پیشنهاد سر دبیر'),
              _getEditorCategorySuggestionList(),
              const SliverPadding(
                padding: EdgeInsets.only(bottom: 60.0),
              )
            ],
          ),
          _getAuomaticScrollSubtitle()
        ],
      ),
    );
  }

  Positioned _getAuomaticScrollSubtitle() {
    return Positioned(
      bottom: 0.0,
      child: Container(
        height: 46.0,
        width: 428.0,
        color: pink,
        child: Marquee(
          textDirection: TextDirection.rtl,
          text:
              'بی‌نظمی شدید در مراسم رونمایی از کاپ جام جهانی و قهر نماینده فیفا       ***       برانکو تکذیب کرد/ نه با عمان فسخ کردم، نه با ایران مذاکره داشتم',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: white,
            fontFamily: 'SM',
            fontSize: 12,
          ),
          scrollAxis: Axis.horizontal,
          crossAxisAlignment: CrossAxisAlignment.center,
          blankSpace: 50.0,
          velocity: 50.0,
          pauseAfterRound: const Duration(seconds: 0),
          startPadding: 65.0,
          accelerationDuration: const Duration(seconds: 0),
          accelerationCurve: Curves.linear,
          decelerationDuration: const Duration(milliseconds: 0),
          decelerationCurve: Curves.easeOut,
        ),
      ),
    );
  }

  SliverToBoxAdapter _getCarouselSlider() {
    return const SliverToBoxAdapter(
      child: CarouselWithIndicatorDemo(),
    );
  }

  SliverToBoxAdapter _getEditorCategorySuggestionList() {
    return SliverToBoxAdapter(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: SizedBox(
          height: 158.0,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: SizedBox(
                  width: 255.0,
                  child: EditorCategorySuggestionContent(
                    editorCategorySuggestionList: editorCategorySuggestionList,
                    index: index,
                  ),
                ),
              );
            },
            itemCount: editorCategorySuggestionList.length,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter _getAgenciesContentList() {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.only(top: 10.0),
        height: 160.0,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return AgenciesContent(
                agenciesList: agenciesList,
                index: index,
              );
            },
            itemCount: 6,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter _getCategoryList() {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.only(top: 10.0),
        height: 36.0,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(
                    () {
                      _currentCategorySelectedIndex = index;
                    },
                  );
                },
                child: CategoryContent(
                  currentCategorySelectedIndex: _currentCategorySelectedIndex,
                  index: index,
                  categoryList: categoryList,
                ),
              );
            },
            itemCount: categoryList.length,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter _getNewsTitle(
      {required String more, required String title}) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 20.0),
        child: Row(
          children: [
            Text(
              more,
              style: const TextStyle(
                color: pink,
                fontSize: 12.0,
                fontFamily: 'SM',
              ),
            ),
            const Spacer(),
            Text(
              title,
              style: const TextStyle(
                color: black,
                fontSize: 16.0,
                fontFamily: 'SM',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CarouselWithIndicatorDemo extends StatefulWidget {
  const CarouselWithIndicatorDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

var myBannersList = [
  const BannerContent(),
  const BannerContent(),
  const BannerContent(),
  const BannerContent(),
  Container(
    margin: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
    height: 300.0,
    width: 200.0,
    child: FittedBox(
      fit: BoxFit.cover,
      child: ClipRRect(
        child: Image.asset(
          Asset.secondBanner,
        ),
      ),
    ),
  )
];

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: white,
      height: 250,
      child: Column(children: [
        Expanded(
          child: CarouselSlider(
            items: myBannersList,
            carouselController: _controller,
            options: CarouselOptions(
                autoPlay: false,
                enlargeCenterPage: true,
                viewportFraction: 1,
                aspectRatio: 2.0,
                height: 220.0,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
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
          children: myBannersList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 5.0,
                height: 5.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black)
                      .withOpacity(_current == entry.key ? 0.9 : 0.4),
                ),
              ),
            );
          }).toList(),
        ),
      ]),
    );
  }
}
