import 'package:flutter/material.dart';
import 'package:instagram_clone/asset.dart';
import 'package:instagram_clone/data/data.dart';
import 'package:instagram_clone/navigator.dart';
import 'package:instagram_clone/pages/pages.dart';
import 'package:instagram_clone/widgets/widgets.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FocusNode passwordFocusNode = FocusNode();

  FocusNode emailFocusNode = FocusNode();

  @override
  void initState() {
    passwordFocusNode.addListener(() {
      setState(() {});
    });
    emailFocusNode.addListener(() {
      setState(() {});
    });
    super.initState();
  }

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
                  _geTitleOfLoginBox(context),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: _getTextField(
                        hintText: 'info.expertflutter.com',
                        inputType: TextInputType.emailAddress,
                        labelText: 'Email',
                      ),
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: _getTextField(
                        hintText: '********************',
                        inputType: TextInputType.visiblePassword,
                        labelText: 'Password',
                      ),
                    ),
                  ),
                  _getSignInButton(),
                  _getFooterBox(context)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    passwordFocusNode.dispose();
    emailFocusNode.dispose();
    super.dispose();
  }

  Row _getFooterBox(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'don\'t have an account? / ',
          style:
              TextStyle(color: Colors.grey, fontSize: 16.0, fontFamily: 'GB'),
          textAlign: TextAlign.center,
        ),
        Text(
          'Sign Up',
          style: Theme.of(context).textTheme.headline1,
        ),
      ],
    );
  }

  Padding _getSignInButton() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: CustomElevatedButton(
        buttonStyle: ElevatedButton.styleFrom(
          backgroundColor: pink,
          minimumSize: const Size(110.0, 40.0),
          textStyle:
              const TextStyle(color: white, fontFamily: 'GB', fontSize: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        buttonText: const Text(
          'Sign in',
          style: TextStyle(fontSize: 16),
        ),
        onPressedFunction: () => navigator(
            context: context,
            destinationPage: const SwitchAccountPage(),
            isPush: true),
      ),
    );
  }

  Padding _geTitleOfLoginBox(BuildContext context) {
    return Padding(
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
    );
  }

  TextField _getTextField(
      {required TextInputType inputType,
      required String hintText,
      required String labelText}) {
    return TextField(
      focusNode: labelText == 'Email' ? emailFocusNode : passwordFocusNode,
      autofocus: false,
      keyboardType: inputType,
      cursorColor: white,
      style: const TextStyle(
        color: white,
        fontSize: 14,
        fontFamily: 'GM',
      ),
      decoration: InputDecoration(
        isDense: true,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 14.0, horizontal: 20.0),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              15.0,
            ),
          ),
          borderSide: BorderSide(color: pink),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              15.0,
            ),
          ),
          borderSide: BorderSide(
            width: 3,
            color: grey,
          ),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: white.withOpacity(0.7),
          fontFamily: 'GM',
          fontSize: 12,
        ),
        labelText: '    $labelText    ',
        labelStyle: TextStyle(
          color: labelText == 'Email'
              ? (emailFocusNode.hasFocus ? pink : grey)
              : (passwordFocusNode.hasFocus ? pink : grey),
          fontFamily: 'GB',
          fontSize: 14,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              15.0,
            ),
          ),
          borderSide: BorderSide(
            width: 3,
            color: pink,
          ),
        ),
      ),
    );
  }
}
