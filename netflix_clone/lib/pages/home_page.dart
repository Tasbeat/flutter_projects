import 'package:flutter/material.dart';
import 'package:netflix_clone/data/data.dart';
import 'package:netflix_clone/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _scrollOffset = 0.0;
  ScrollController? _scrollController;
  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _scrollOffset = _scrollController!.offset;
        });
      });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _getAppBar(),
      floatingActionButton: _getFloatingActionButton(),
      backgroundColor: Colors.black,
      body: _getBody(),
    );
  }

  PreferredSize _getAppBar() {
    return PreferredSize(
      preferredSize: const Size(
        double.infinity,
        50.0,
      ),
      child: CustomAppBar(scrollOffset: _scrollOffset),
    );
  }

  FloatingActionButton _getFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () => print('Cast'),
      backgroundColor: Colors.grey[850],
      child: const Icon(Icons.cast),
    );
  }

  CustomScrollView _getBody() {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverToBoxAdapter(
          child: ContentHeader(
            key: const PageStorageKey('ContentHeader'),
            featuredContent: sintelContent,
          ),
        ),
        SliverToBoxAdapter(
          child: PreviewContents(
            key: const PageStorageKey('PreviewContents'),
            title: 'Previews',
            previewsContentList: previewsContentList,
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 20.0),
        ),
        SliverToBoxAdapter(
          child: OtherContent(
            key: const PageStorageKey('OtherContent1'),
            title: 'My List',
            otherContentList: myList,
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 20.0),
        ),
        SliverToBoxAdapter(
          child: OtherContent(
            key: const PageStorageKey('OtherContent2'),
            title: 'Orginals',
            otherContentList: originals,
            isOriginalsContentList: true,
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 20.0),
        ),
        SliverToBoxAdapter(
          key: const PageStorageKey('OtherContent3'),
          child: OtherContent(
            title: 'Trending',
            otherContentList: trending,
          ),
        ),
      ],
    );
  }
}
