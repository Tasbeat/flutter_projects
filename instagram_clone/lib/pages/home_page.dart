import 'package:flutter/material.dart';
import 'package:instagram_clone/asset.dart';
import 'package:instagram_clone/data/data.dart';
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
        child: CustomAppBar(
          leadingWidth: 130.0,
          leadingWidget: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Image.asset(Asset.moodinegarLogo),
          ),
          actions: [
            Image.asset(Asset.directIcon),
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: [
          _getStoryContent(screenSize),
          PostContent(postList: postList),
          const SliverPadding(
            padding: EdgeInsets.only(bottom: 30.0),
          )
        ],
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
}
