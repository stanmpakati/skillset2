import 'package:at_chat_flutter/at_chat_flutter.dart';
import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  static const id = 'chat';
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with '),
      ),
      body: ChatScreen(
        incomingMessageColor: Colors.amber[100],
        outgoingMessageColor: Colors.blue[100],
      ),
    );
  }
}
