import 'package:flutter/material.dart';

class AddProductsScreen extends StatelessWidget {
  const AddProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Products'),
      ),
      body: const Center(
        child: Text('Add Products Screen'),
      ),
    );
  }
}