import 'package:flutter/material.dart';
import 'package:my_store/core/styles/images/app_images.dart';

class UnderBuildScreen extends StatelessWidget {
  const UnderBuildScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.pageUnderBuild),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
