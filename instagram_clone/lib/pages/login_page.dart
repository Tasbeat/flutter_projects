import 'package:flutter/material.dart';
import 'package:instagram_clone/asset.dart';
import 'package:instagram_clone/data/data.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: screenSize.height,
          ),
          Positioned(
            child: Container(
              height: 400.0,
              width: screenSize.width,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xff383d9c),
                    Color(0xff8f60c7),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          Positioned(
            top: 35.0,
            child: Container(
              height: 400.0,
              width: screenSize.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Asset.rocket),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0.0,
            child: Container(
              height: 270.0,
              width: screenSize.width,
              decoration: const BoxDecoration(
                color: black,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Sign in to ',
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        Image.asset(Asset.miniLogo)
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: TextField(
                        autofocus: false,
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: white,
                        style: const TextStyle(
                          color: white,
                          fontSize: 7,
                          fontFamily: 'GM',
                        ),
                        decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                20.0,
                              ),
                            ),
                            borderSide: BorderSide(
                              width: 3,
                              color: Color(0xffC5C5C5),
                            ),
                          ),
                          hintText: 'info.expertflutter.com',
                          hintStyle: TextStyle(
                            color: white.withOpacity(0.7),
                            fontFamily: 'GM',
                            fontSize: 12,
                          ),
                          labelText: '    Email    ',
                          labelStyle: const TextStyle(
                            color: white,
                            fontFamily: 'GB',
                            fontSize: 14,
                          ),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                20.0,
                              ),
                            ),
                            borderSide: BorderSide(
                              width: 3,
                              color: pink,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
