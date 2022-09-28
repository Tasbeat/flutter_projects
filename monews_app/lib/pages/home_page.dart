import 'package:flutter/material.dart';
import 'package:monews_app/asset.dart';
import 'package:monews_app/data/data.dart';
import 'package:monews_app/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _getHomeAppBar(),
      backgroundColor: white,
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            _getTabBar(screenSize),
            Expanded(
              child: _getTabBarView(),
            ),
          ],
        ),
      ),
    );
  }

  TabBarView _getTabBarView() {
    return TabBarView(
      children: [
        CustomScrollView(
          slivers: [
            const SliverPadding(padding: EdgeInsets.only(top: 34.0)),
            _getNewsTitle(more: 'مشاهده بیشتر', title: 'خبر های داغ'),
            _getHotNewsList(),
            const SliverPadding(padding: EdgeInsets.only(top: 32.0)),
            _getNewsTitle(more: 'مشاهده بیشتر', title: 'خبرهایی که علاقه داری'),
            _getSuggestionNewsList()
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
        textDirection: TextDirection.rtl,
        child: SizedBox(
          height: 280.0,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return const HotNewsContent();
            },
            scrollDirection: Axis.horizontal,
          ),
        ),
      ),
    );
  }

  SliverList _getSuggestionNewsList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return const Directionality(
            textDirection: TextDirection.rtl,
            child: SuggestionNewsContent(),
          );
        },
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
        textDirection: TextDirection.rtl,
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
              text: 'پیشنهادی',
            ),
            Tab(
              text: 'دنبال میکنید',
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
