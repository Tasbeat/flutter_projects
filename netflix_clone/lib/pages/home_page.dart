import 'package:flutter/material.dart';
import 'package:netflix_clone/assets.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: CustomAppBar(),
        preferredSize: Size(
          double.infinity,
          50.0,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print('Cast'),
        child: Icon(Icons.cast),
        backgroundColor: Colors.grey[850],
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: CustomScrollView(controller: _scrollController),
      ),
    );
  }
}
