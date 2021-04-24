import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'message_bubble.dart';

class MessagesStream extends StatelessWidget {
  const MessagesStream(
      {Key key,
      @required Firestore firestore,
      @required FirebaseUser currentUser})
      : _firestore = firestore,
        _currentUser = currentUser,
        super(key: key);

  final Firestore _firestore;
  final FirebaseUser _currentUser;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore
          .collection('messages')
          .orderBy('createdAt', descending: false)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }

        final messages = snapshot.data.documents.reversed;
        List<MessageBubble> messageBubbles = [];
        for (var message in messages) {
          final messageText = message.data['text'];
          final messageSender = message.data['sender'];

          final messageBubble = MessageBubble(
            text: messageText,
            from: messageSender,
            isLoggedInUser: _currentUser.email == messageSender,
          );
          messageBubbles.add(messageBubble);
        }
        return Expanded(
          child: ListView(
            reverse: true,
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            children: messageBubbles,
          ),
        );
      },
    );
  }
}
