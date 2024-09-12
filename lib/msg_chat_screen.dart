import 'package:flutter/material.dart';

import 'user_model.dart';

class MsgChatScreen extends StatelessWidget {
  const MsgChatScreen({super.key, required this.otherUser});
  final UserModel otherUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Text("${otherUser.name}"),
      ),
      body: Column(
        children: [
          Text("data"),
        ],
      ),
    );
  }
}
