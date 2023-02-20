import 'package:flutter/material.dart';
import 'custom_widges/post_widget.dart';

class BlogPage extends StatelessWidget {
  BlogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _getBlogPageBar(),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    final listBlogWidget = [
      getBlogPost('a.png', 'Alchemy Pay'),
      getBlogPost('c.png', 'Cosmos'),
      getBlogPost('r.png', 'Ripple'),
      getBlogPost('s.png', 'Safe Moon'),
    ];
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ...listBlogWidget,
              SizedBox(height: 20.0),
              _getSignOutButton(context),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getSignOutButton(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        primary: Colors.blue,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
      child: Text(
        'Sign Out!',
        style: TextStyle(color: Colors.blue, fontSize: 16),
      ),
    );
  }

  PreferredSizeWidget _getBlogPageBar() {
    return AppBar(
      iconTheme: IconThemeData(size: 20.0, color: Colors.black),
      centerTitle: true,
      elevation: 0.0,
      backgroundColor: Colors.white,
      title: Text(
        'Blog page',
        style: TextStyle(color: Colors.black, fontSize: 20.0),
      ),
    );
  }
}
