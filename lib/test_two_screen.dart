import 'package:flutter/material.dart';

class TestTwoScreen extends StatelessWidget {
  const TestTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'This is the second screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
