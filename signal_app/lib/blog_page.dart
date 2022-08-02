import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:signal_app/navigator.dart';

import 'custom_widges/post_widget.dart';

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
    var imageNames = ['a.png', 'c.png', 'r.png', 's.png'];
    var cryptoName = ['Alchemy Pay', 'Cosmos', 'Ripple', 'Safe Moon'];
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              for (var index = 0; index < imageNames.length; index++)
                getContents(imageNames[index], cryptoName[index]),
              SizedBox(height: 20.0),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.blue,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'خروج از حساب',
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
              ),
              SizedBox(height: 20.0),
            ],
          ),
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
        'Blog page',
        style: TextStyle(color: Colors.black, fontSize: 20.0),
      ),
    );
  }
}
