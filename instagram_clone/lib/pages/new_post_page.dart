import 'package:flutter/material.dart';
import 'package:instagram_clone/asset.dart';
import 'package:instagram_clone/data/data.dart';
import 'package:instagram_clone/widgets/widgets.dart';

class NewPostPage extends StatefulWidget {
  const NewPostPage({Key? key}) : super(key: key);

  @override
  State<NewPostPage> createState() => _NewPostPageState();
}

class _NewPostPageState extends State<NewPostPage> {
  int _currentScreenIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: _getBottomNavigationBar(),
      backgroundColor: black,
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 50.0),
        child: _getCustomAppBar(context),
      ),
      body: _getBody(screenSize),
    );
  }

  Padding _getBody(Size screenSize) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage(Asset.moonWallpaper),
                ),
                borderRadius: BorderRadius.circular(15.0),
              ),
              height: 320.0,
              width: screenSize.width,
            ),
          ),
          const SliverPadding(
            padding: EdgeInsets.only(top: 5.0),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage(Asset.moonWallpaper),
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                );
              },
              childCount: 30,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
            ),
          ),
        ],
      ),
    );
  }

  ClipRRect _getBottomNavigationBar() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(15.0),
        topRight: Radius.circular(15.0),
      ),
      child: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: const Color(0xff272B40),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            label: 'test',
            icon: Text(
              'Draft',
              style: TextStyle(
                fontFamily: 'GB',
                color: _currentScreenIndex == 0 ? pink : white,
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: 'test',
            icon: Text(
              'Gallery',
              style: TextStyle(
                fontFamily: 'GB',
                color: _currentScreenIndex == 1 ? pink : white,
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: 'test',
            icon: Text(
              'Take',
              style: TextStyle(
                fontFamily: 'GB',
                color: _currentScreenIndex == 2 ? pink : white,
              ),
            ),
          ),
        ],
        currentIndex: _currentScreenIndex,
        onTap: (value) {
          setState(() {
            _currentScreenIndex = value;
          });
        },
      ),
    );
  }

  CustomAppBar _getCustomAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 80.0,
      actions: [
        Center(
          child: Text(
            'Next',
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        Image.asset(Asset.nextIcon),
      ],
      leadingWidget: Directionality(
        textDirection: TextDirection.rtl,
        child: TextButton.icon(
          onPressed: () {},
          icon: Image.asset(Asset.bottomArrowIcon),
          label: Text(
            'Post',
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
      ),
    );
  }
}
