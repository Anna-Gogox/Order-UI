import 'package:flutter/material.dart';

class UserDetailScreen extends StatelessWidget {
  const UserDetailScreen({super.key, required this.userId});
  final int userId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Detail"),
      ),
      body: Center(
        child: Text("User ID: $userId", style: const TextStyle(fontSize: 20)),
      ),
    );
  }
}