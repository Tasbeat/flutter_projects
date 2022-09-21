import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/data/data.dart';
import 'package:instagram_clone/widgets/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../asset.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: black,
      extendBody: true,
      body: CustomScrollView(
        slivers: [
          const SliverPadding(
            padding: EdgeInsets.only(top: 20.0),
          ),
          _getExploreSearchBox(),
          _getCategories(),
          _getCustomGrid()
        ],
      ),
    );
  }

  SliverToBoxAdapter _getCustomGrid() {
    return SliverToBoxAdapter(
      child: SizedBox(
        width: 200.0,
        height: 450.0,
        child: GridView.custom(
          padding: const EdgeInsets.only(
            bottom: 0.0,
            left: 10.0,
            right: 10.0,
          ),
          gridDelegate: SliverQuiltedGridDelegate(
            crossAxisCount: 3,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            repeatPattern: QuiltedGridRepeatPattern.same,
            pattern: patternList,
          ),
          childrenDelegate: SliverChildBuilderDelegate(
            (context, index) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(exploreList[index].imageUrl),
                    fit: BoxFit.cover,
                  ),
                  color: pink,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              );
            },
            childCount: exploreList.length,
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter _getCategories() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
        child: SizedBox(
          height: 30.0,
          width: double.infinity,
          child: CategoryContent(categoryList: categoryList),
        ),
      ),
    );
  }

  SliverToBoxAdapter _getExploreSearchBox() {
    return SliverToBoxAdapter(
      child: Container(
        height: 46.0,
        width: 340.0,
        margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 12.0),
        decoration: BoxDecoration(
          color: const Color(0xff272B40),
          borderRadius: BorderRadius.circular(13),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: SvgPicture.asset(
                Asset.exploreIcon,
                color: white,
              ),
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 12.0, bottom: 11.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    hintStyle: TextStyle(
                      color: white,
                      fontFamily: 'GB',
                      fontSize: 12,
                    ),
                    fillColor: Color(0xff272B40),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Image.asset(
                Asset.scanIcon,
                color: white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
