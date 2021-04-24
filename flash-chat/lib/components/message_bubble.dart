import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String text;
  final String from;
  final bool isLoggedInUser;

  MessageBubble({@required this.text, @required this.from, @required this
      .isLoggedInUser});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: isLoggedInUser ? CrossAxisAlignment.end :
        CrossAxisAlignment.start,
        children: [
          Text(
            from,
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.black54,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Material(
            elevation: 5.0,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(isLoggedInUser ? 30.0 : 0),
                topRight: Radius.circular(isLoggedInUser ? 0 : 30.0),
                bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0)),
            color: isLoggedInUser ? Colors.lightBlueAccent : Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                '$text',
                style: TextStyle(
                  color: isLoggedInUser ? Colors.white : Colors.black,
                  fontSize: 15.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
