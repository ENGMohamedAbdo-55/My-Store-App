import 'package:flutter/material.dart';

class AddNotificationScreen extends StatelessWidget {
  const AddNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Notification'),
      ),
      body: const Center(
        child: Text('Add Notification Screen'),
      ),
    );
  }
}