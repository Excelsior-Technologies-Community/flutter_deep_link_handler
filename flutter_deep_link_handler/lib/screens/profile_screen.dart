import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
    ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    final String? userId = args?['id'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: Text(
          userId == null
              ? 'Profile Screen (No User ID)'
              : 'Profile Screen for User ID: $userId',
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
