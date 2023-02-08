import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monews_app/asset.dart';
import 'package:monews_app/data/data.dart';
import 'package:monews_app/navigator.dart';
import 'package:monews_app/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isReportPage = false;

  // bool _showModal = false;
  // final _scaffoldKey = GlobalKey<ScaffoldState>();

  // PersistentBottomSheetController? _bottomSheetController;

  // void _showOrHide(bool show) {
  //   setState(() {
  //     _showModal = show;
  //     if (_showModal) {
  //       _bottomSheetController = _scaffoldKey.currentState!.showBottomSheet(
  //         (_) => Container(
  //           height: MediaQuery.of(context).size.height,
  //           width: MediaQuery.of(context).size.width,
  //           child: Stack(
  //             children: [
  //               Image.asset(Asset.playerPhoto),
  //               CustomButtomSheet(),
  //             ],
  //           ),
  //         ),
  //         backgroundColor: Colors.white,
  //       );
  //     } else {
  //       if (_bottomSheetController != null) _bottomSheetController!.close();
  //       _bottomSheetController = null;
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      // key: _scaffoldKey,
      appBar: _getHomeAppBar(),
      backgroundColor: white,
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            _getTabBar(screenSize),
            Expanded(
              child: _getTabBarView(context),
            ),
          ],
        ),
      ),
    );
  }

  TabBarView _getTabBarView(BuildContext context) {
    return TabBarView(
      children: [
        CustomScrollView(
          slivers: [
            const SliverPadding(padding: EdgeInsets.only(top: 34.0)),
            _getNewsTitle(more: 'More', title: 'Hot News'),
            _getHotNewsList(),
            const SliverPadding(padding: EdgeInsets.only(top: 32.0)),
            _getNewsTitle(more: 'More', title: 'You Liked'),
            _getSuggestionNewsList(),
            const SliverPadding(padding: EdgeInsets.only(bottom: 10.0)),
          ],
        ),
        const CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Text(
                'New',
              ),
            )
          ],
        ),
      ],
    );
  }

  SliverToBoxAdapter _getHotNewsList() {
    return SliverToBoxAdapter(
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: SizedBox(
          height: 280.0,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  _showModalBottomSheet(context);
                },
                child: HotNewsContent(hotNewsList: hotNewsList, index: index),
              );
            },
            scrollDirection: Axis.horizontal,
            itemCount: hotNewsList.length,
          ),
        ),
      ),
    );
  }

  Future<dynamic> _showModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      barrierColor: transparent,
      backgroundColor: transparent,
      isScrollControlled: true,
      context: context,
      builder: (context) => Container(
        margin: const EdgeInsets.only(bottom: 60.0),
        color: black,
        child: Stack(
          children: [
            Image.asset(Asset.playerPhoto),
            Positioned(
              top: 25.0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0, left: 10.0),
                      child: SvgPicture.asset(Asset.verticalShortMenu),
                    ),
                    SvgPicture.asset(Asset.addBookmark),
                    const Spacer(),
                    GestureDetector(
                      onTap: () => navigator(
                        context: context,
                        destinationPage: const HomePage(),
                        isPush: false,
                      ),
                      child: SvgPicture.asset(Asset.arrowRight),
                    )
                  ],
                ),
              ),
            ),
            const CustomButtomSheet(),
          ],
        ),
      ),
    );
  }

  SliverList _getSuggestionNewsList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Directionality(
            textDirection: TextDirection.ltr,
            child: SuggestionNewsContent(
                suggestionNewsList: suggestionNewsList, index: index),
          );
        },
        childCount: suggestionNewsList.length,
      ),
    );
  }

  SliverToBoxAdapter _getNewsTitle(
      {required String more, required String title}) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
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

  Container _getTabBar(Size screenSize) {
    return Container(
      padding: const EdgeInsets.only(right: 4.0, left: 4.0),
      margin: const EdgeInsets.only(
          right: 24.0, left: 24.0, top: 20.0, bottom: 8.0),
      height: 45.0,
      width: screenSize.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22.0),
        boxShadow: [
          BoxShadow(
            color: black.withOpacity(0.5),
            offset: const Offset(0.0, 5.0), //(x,y)
            blurRadius: 20.0,
          ),
        ],
      ),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: TabBar(
          labelColor: white,
          labelStyle: const TextStyle(fontFamily: 'SM', color: white),
          unselectedLabelColor: grey,
          unselectedLabelStyle: const TextStyle(fontFamily: 'SM', color: white),
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(
              20.0,
            ),
            color: pink,
          ),
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          tabs: const [
            Tab(
              text: 'Suggestion',
            ),
            Tab(
              text: 'You Following',
            ),
          ],
        ),
      ),
    );
  }

  AppBar _getHomeAppBar() {
    return AppBar(
      centerTitle: true,
      title: Image.asset(Asset.monewsLogo),
      backgroundColor: white,
      elevation: 0.0,
      leading: Image.asset(Asset.notificationStatus),
    );
  }
}
