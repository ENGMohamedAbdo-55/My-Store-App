import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/common/animation/animate_do.dart';

class UserAvatarImage extends StatelessWidget {
  const UserAvatarImage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadeInDown(
      duration: 400,
      child: CircleAvatar(
        radius: 45.r,
        backgroundImage: const AssetImage(
          'assets/images/core/WhatsApp Image 2024-12-07 at 13.40.14_2a1cc6d3.jpg',
        ),
      ),
    );
    
  }
}
