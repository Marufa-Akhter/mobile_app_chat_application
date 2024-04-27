import 'package:flutter/material.dart';
import 'package:chat_application_iub_cse464/models/user_model.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Hardcoded list of fixed users
    final List<UserModel> fixedUsers = [
      UserModel(
        name: 'John Doe',
        email: 'john.doe@example.com',
        avatarUrl: 'assets/avatar1.png',
      ),
      UserModel(
        name: 'Mahan',
        email: 'mahan@example.com',
        avatarUrl: 'assets/avatar2.png',
      ),
      UserModel(
        name: 'Mim',
        email: 'mim.marufa@example.com',
        avatarUrl: 'assets/avatar3.png',
      ),
      UserModel(
        name: 'Marufa',
        email: 'marufa@example.com',
        avatarUrl: 'assets/avatar4.png',
      ),
      UserModel(
        name: 'Shakila',
        email: 'shakila@example.com',
        avatarUrl: 'assets/avatar5.png',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Discover'),
      ),
      body: ListView.builder(
        itemCount: fixedUsers.length,
        itemBuilder: (context, index) {
          final user = fixedUsers[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(user.avatarUrl ?? ''),
            ),
            title: Text(user.name ?? ''),
            subtitle: Text(user.email ?? ''),
            // Add more user information as needed
          );
        },
      ),
    );
  }
}