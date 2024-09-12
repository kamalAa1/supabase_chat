import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'chat_with_users_screen.dart';
import 'user_model.dart';

class AllUserScreen extends StatefulWidget {
  const AllUserScreen({super.key});

  @override
  _AllUserScreenState createState() => _AllUserScreenState();
}

class _AllUserScreenState extends State<AllUserScreen> {
  final SupabaseClient supabase = Supabase.instance.client;
  List<UserModel> users = [];
  bool isLoading = false;
  bool hasMore = true;
  int page = 0;
  final int pageSize = 10;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _fetchUsers();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          hasMore &&
          !isLoading) {
        _fetchUsers();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _fetchUsers() async {
    final response =
        await supabase.from('Users').select('id, name, email').limit(pageSize);

    debugPrint(response.length.toString());
    if (response.isNotEmpty) {
      users = response.map((ele) => UserModel.fromJson(ele)).toList();

      if (users.length < pageSize) {
        hasMore = false;
      }

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat Screen"),
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: users.length + (hasMore ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == users.length) {
            return const Center(child: CircularProgressIndicator());
          }

          final user = users[index];
          // final lastMessage = user['messages'] != null && user['messages'].isNotEmpty
          //     ? user['messages'][0]
          //     : null;

          return Card(
            child: ListTile(
              leading: const CircleAvatar(
                backgroundImage:
                    NetworkImage('https://via.placeholder.com/150'),
              ),
              title: Text(user.name ?? 'Unknown User'),
              // subtitle: Text(lastMessage != null
              //     ? '${lastMessage['message_text']} - ${_formatTimestamp(lastMessage['created_at'])}'
              //     : 'No messages yet'),

              trailing: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChatWithUserScreen(
                                user: user,
                              )));
                },
                child: const Text("Select"),
              ),
            ),
          );
        },
      ),
    );
  }

  String _formatTimestamp(String timestamp) {
    final dateTime = DateTime.parse(timestamp);
    return '${dateTime.hour}:${dateTime.minute}, ${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }
}
