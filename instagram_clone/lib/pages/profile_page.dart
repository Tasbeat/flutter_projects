import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/asset.dart';
import 'package:instagram_clone/data/data.dart';
import 'package:instagram_clone/widgets/widgets.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              _getSliverAppBar(),
              _getHeaderProfileTile(),
              _getProfileBio(),
              _getBioLink(),
              const SliverPadding(padding: EdgeInsets.only(top: 15.0)),
              _getJobAndLocation(),
              const SliverPadding(padding: EdgeInsets.only(top: 20.0)),
              _getActivities(),
              const SliverPadding(padding: EdgeInsets.only(top: 30.0)),
              _getButtons(),
              const SliverPadding(padding: EdgeInsets.only(top: 20.0)),
              _getHighlights(),
              SliverPersistentHeader(
                pinned: true,
                floating: true,
                delegate: TabBarViewDelegate(
                  TabBar(
                    indicatorColor: pink,
                    indicatorWeight: 2,
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: [
                      Tab(
                        icon: SvgPicture.asset(Asset.postsIcon),
                      ),
                      Tab(
                        icon: SvgPicture.asset(Asset.bookmarksIcon),
                      ),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: _getTabBarView(),
        ),
      ),
    );
  }

  SliverToBoxAdapter _getHighlights() {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 100.0,
        child: HighlightContent(highlightList: highlightList),
      ),
    );
  }

  SliverToBoxAdapter _getButtons() {
    return SliverToBoxAdapter(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomElevatedButton(
            onPressedFunction: () {},
            buttonText: const Text('Follow'),
            buttonStyle: ElevatedButton.styleFrom(
              backgroundColor: pink,
              minimumSize: const Size(155, 46),
            ),
          ),
          CustomElevatedButton(
            onPressedFunction: () {},
            buttonText: const Text('Message'),
            buttonStyle: ElevatedButton.styleFrom(
              backgroundColor: black,
              side: const BorderSide(color: white, width: 2.0),
              minimumSize: const Size(155, 46),
            ),
          ),
        ],
      ),
    );
  }

  TabBarView _getTabBarView() {
    return TabBarView(
      children: [
        _getCustomGrid(),
        _getCustomGrid(),
      ],
    );
  }

  CustomScrollView _getCustomGrid() {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.only(
            top: 15,
            left: 12,
            right: 12,
          ),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
              ((context, index) {
                return Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Image.asset(Asset.moonWallpaper),
                    ),
                  ),
                );
              }),
              childCount: 12,
            ),
            gridDelegate: SliverQuiltedGridDelegate(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              repeatPattern: QuiltedGridRepeatPattern.inverted,
              pattern: [
                QuiltedGridTile(1, 1),
                QuiltedGridTile(2, 2),
                QuiltedGridTile(1, 1),
                QuiltedGridTile(1, 1),
                QuiltedGridTile(1, 1),
                QuiltedGridTile(1, 1),
              ],
            ),
          ),
        ),
        const SliverPadding(
          padding: EdgeInsets.only(
            bottom: 70.0,
          ),
        )
      ],
    );
  }

  SliverToBoxAdapter _getActivities() {
    return SliverToBoxAdapter(
      child: Row(
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 20.0, right: 5.0),
            child: Text(
              '23',
              style: TextStyle(color: white, fontFamily: 'GB'),
            ),
          ),
          Text(
            'Posts',
            style: TextStyle(
              color: grey,
              fontSize: 10.0,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0, right: 5.0),
            child: Text(
              '10K',
              style: TextStyle(color: white, fontFamily: 'GB'),
            ),
          ),
          Text(
            'Followers',
            style: TextStyle(
              color: grey,
              fontSize: 10.0,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0, right: 5.0),
            child: Text(
              '500',
              style: TextStyle(color: white, fontFamily: 'GB'),
            ),
          ),
          Text(
            'Following',
            style: TextStyle(
              color: grey,
              fontSize: 10.0,
            ),
          ),
        ],
      ),
    );
  }

  SliverToBoxAdapter _getJobAndLocation() {
    return SliverToBoxAdapter(
      child: Row(
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 20.0, right: 5.0),
            child: Image(
              image: AssetImage(Asset.jobIcon),
            ),
          ),
          Text(
            'developer',
            style: TextStyle(
              color: grey,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0, right: 5.0),
            child: Image(
              image: AssetImage(Asset.locationIcon),
            ),
          ),
          Text(
            'IRAN',
            style: TextStyle(
              color: grey,
            ),
          ),
        ],
      ),
    );
  }

  SliverToBoxAdapter _getBioLink() {
    return SliverToBoxAdapter(
      child: Row(
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 20.0, right: 5.0),
            child: Image(
              image: AssetImage(Asset.linkIcon),
            ),
          ),
          Text(
            'yek.link/...',
            style: TextStyle(
              color: blue2,
            ),
          )
        ],
      ),
    );
  }

  SliverToBoxAdapter _getProfileBio() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 100.0,
              width: 195.0,
              child: RichText(
                maxLines: 4,
                softWrap: true,
                textDirection: TextDirection.ltr,
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text:
                          'علی علیرحیمی هستم برنامه نویس اندروید وفلاتر با سابقه کاری 3 سال و مدیر بخش کنترل کیفی شرکت اصل فولاد ',
                      style: TextStyle(
                        fontFamily: 'GM',
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _getHeaderProfileTile() {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 75.0,
        child: ListTile(
          trailing: SizedBox(
            width: 30.0,
            height: 80.0,
            child: Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Column(
                children: [
                  Image.asset(Asset.editProfileIcon),
                ],
              ),
            ),
          ),
          title: const Text(
            'برنامه نویس موبایل',
            style: TextStyle(
              color: white,
              fontFamily: 'SM',
              fontSize: 12,
            ),
          ),
          subtitle: const Text(
            '_tasbeat_',
            style: TextStyle(
              color: grey,
              fontFamily: 'GB',
              fontSize: 12,
            ),
          ),
          contentPadding: const EdgeInsets.only(left: 20.0),
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 55.0,
                width: 55.0,
                child: DottedBorder(
                  dashPattern: const [55, 8],
                  strokeWidth: 2,
                  borderType: BorderType.RRect,
                  color: pink,
                  radius: const Radius.circular(14),
                  padding: const EdgeInsets.all(4),
                  child: const ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: Image(
                      image: AssetImage(Asset.followerImage8),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SliverAppBar _getSliverAppBar() {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: false,
      toolbarHeight: 50.0,
      actions: const [
        Padding(
          padding: EdgeInsets.only(bottom: 10.0, right: 10.0),
          child: Icon(Icons.menu),
        )
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(10.0),
        child: Container(
          height: 14.0,
          decoration: const BoxDecoration(
            color: black,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
            ),
          ),
        ),
      ),
      backgroundColor: black,
      expandedHeight: 130.0,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          Asset.moonWallpaper,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class TabBarViewDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;
  TabBarViewDelegate(this._tabBar);
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: black,
      child: _tabBar,
    );
  }

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
