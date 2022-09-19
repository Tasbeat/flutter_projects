import 'package:flutter/material.dart';
import 'package:instagram_clone/data/data.dart';
import 'package:instagram_clone/navigator.dart';
import 'package:instagram_clone/widgets/widgets.dart';

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
      backgroundColor: black,
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 50),
        child: const HomeAppBar(),
      ),
      body: CustomScrollView(
        slivers: [
          _getCustomElevatedButton(context),
          _getStoryContent(screenSize),
          PostContent(postList: postList),
          const SliverPadding(
            padding: EdgeInsets.only(bottom: 30.0),
          )
        ],
      ),
    );
  }

  SliverToBoxAdapter _getCustomElevatedButton(BuildContext context) {
    return SliverToBoxAdapter(
      child: CustomElevatedButton(
        onPressedFunction: () => showModalBottomSheet(
          barrierColor: transparent,
          backgroundColor: transparent,
          isScrollControlled: true,
          context: context,
          builder: (context) => _makeDismissible(
            child: _getDraggableScrollableSheet(),
          ),
        ),
        buttonText: const Text('Open Bottom Sheet'),
        buttonStyle: Theme.of(context).elevatedButtonTheme.style!,
      ),
    );
  }

  SliverToBoxAdapter _getStoryContent(Size screenSize) {
    return SliverToBoxAdapter(
      child: SizedBox(
        width: screenSize.width,
        height: 100.0,
        child: StoryContent(storyList: storyList),
      ),
    );
  }

  CustomButtomSheet _getDraggableScrollableSheet() {
    return CustomButtomSheet(followerList: followerList);
  }

  Widget _makeDismissible({required Widget child}) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          print('Hit Test');
          navigator(
              context: context,
              destinationPage: const HomePage(),
              isPush: false);
        },
        child: GestureDetector(
          onTap: () {
            print('Hit Child');
          },
          child: child,
        ),
      );
}
