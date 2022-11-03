import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String messageText;
  final String messageSender;
  final bool isCurrentUser;
  const MessageBubble(
      {super.key,
      required this.messageText,
      required this.messageSender,
      required this.isCurrentUser});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
          child: Text(
            messageSender,
            style: const TextStyle(color: Colors.black38, fontSize: 12),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Material(
            color: isCurrentUser ? Colors.blue : Colors.white54,
            elevation: 10.0,
            borderRadius: isCurrentUser
                ? const BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    bottomLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                  )
                : const BorderRadius.only(
                    topRight: Radius.circular(15.0),
                    bottomLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                  ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                messageText,
                style: const TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
