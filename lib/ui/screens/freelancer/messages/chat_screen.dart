import 'package:at_chat_flutter/at_chat_flutter.dart';
import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
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
        incomingMessageColor: Colors.blue[100],
        outgoingMessageColor: Colors.amber[100],
      ),
    );
  }
}
