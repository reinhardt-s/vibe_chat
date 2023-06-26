import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final sender;
  final text;
  final DateTime timestamp;
  final bool isMe;

  const MessageBubble({super.key, this.sender, this.text, this.isMe = false, required this.timestamp});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: Text(sender, style: TextStyle(fontSize: 12.0, color: Colors.white54)),
          ),
          Material(
            elevation: 5.0,
            borderRadius: isMe
                ? BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                  )
                : BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                  ),
            color: isMe ? Colors.lightBlueAccent : Colors.black87,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                text,
                style: TextStyle(color: Colors.white, fontSize: 15.0),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text('${timestamp.hour}:${timestamp.minute}:${timestamp.second} - ${timestamp.day}.${timestamp.month}.${timestamp.year}', style: TextStyle(fontSize: 12.0, color: Colors.white54)),
          ),
        ],
      ),
    );
  }
}
