import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'widgets.dart';

class MessagesStreamBuilderWidget extends StatelessWidget {
  const MessagesStreamBuilderWidget({
    Key? key,
    required this.firestore,
    required this.loggedInUser,
  }) : super(key: key);

  final FirebaseFirestore firestore;
  final User? loggedInUser;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: firestore.collection('messages').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final messages = snapshot.data!.docs.reversed;
        List<MessageBubble> messageBubbles = [];
        for (var message in messages) {
          final messageText = message.get('text');
          final messageSender = message.get('sender');

          messageBubbles.add(
            MessageBubble(
              messageText: messageText,
              messageSender: messageSender,
              isCurrentUser: messageSender == loggedInUser!.email,
            ),
          );
        }
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: ListView(
              reverse: true,
              children: messageBubbles,
            ),
          ),
        );
      },
    );
  }
}
