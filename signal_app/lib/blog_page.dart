import 'package:flutter/material.dart';

import 'login_page.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _getBlogPageBar(),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Image(
          image: AssetImage('images/s.png'),
        ),
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
        'Second Screen',
        style: TextStyle(color: Colors.black, fontSize: 20.0),
      ),
    );
  }
}
