import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/constants.dart';
import 'package:flash_chat/pages/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../asset.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';

  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String? email;
  String? password;
  var auth = FirebaseAuth.instance;
  bool isSpinnerShow = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      body: ModalProgressHUD(
        opacity: 0.7,
        blur: 1.0,
        inAsyncCall: isSpinnerShow,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: SizedBox(
                    height: 200.0,
                    child: Image.asset(Asset.logo),
                  ),
                ),
              ),
              const SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                ),
                onChanged: (value) {
                  email = value;
                },
                decoration: textFieldsInputDecorations.copyWith(
                  hintText: 'Enter your Email',
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white),
                onChanged: (value) {
                  password = value;
                },
                decoration: textFieldsInputDecorations.copyWith(
                    hintText: 'Enter your Password',
                    hintStyle: const TextStyle(color: Colors.grey)),
              ),
              const SizedBox(
                height: 24.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Material(
                  color: Colors.blueAccent,
                  borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                  elevation: 5.0,
                  child: MaterialButton(
                    onPressed: () async {
                      setState(() {
                        isSpinnerShow = true;
                      });
                      try {
                        final UserCredential newUser =
                            await auth.createUserWithEmailAndPassword(
                                email: email!, password: password!);
                        Navigator.pushNamed(context, ChatScreen.id);
                      } catch (e) {
                        AnimatedSnackBar.rectangle(
                          'Error',
                          'Wrong Email Or Password',
                          type: AnimatedSnackBarType.error,
                          brightness: Brightness.light,
                          mobileSnackBarPosition: MobileSnackBarPosition.top,
                        ).show(
                          context,
                        );
                      }
                      setState(() {
                        isSpinnerShow = false;
                      });
                    },
                    minWidth: 200.0,
                    height: 42.0,
                    child: const Text(
                      'Register',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
