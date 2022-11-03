import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  static const String id = 'chat_screen';

  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  String? messageText;
  User? loggedInUser;
  var messageTextController = TextEditingController();
  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: [
          IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                auth.signOut();
                Navigator.pop(context);
              }),
        ],
        title: const Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MessagesStreamBuilderWidget(
              firestore: firestore,
              loggedInUser: loggedInUser,
            ),
            getUserMessageBox(),
          ],
        ),
      ),
    );
  }

  Container getUserMessageBox() {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              controller: messageTextController,
              onChanged: (value) {
                messageText = value;
              },
              decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                hintText: 'Type your message here...',
                border: InputBorder.none,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              firestore
                  .collection('messages')
                  .add({'text': messageText, 'sender': loggedInUser!.email});
              messageTextController.clear();
            },
            child: const Text(
              'Send',
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
