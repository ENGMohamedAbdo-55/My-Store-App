import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdateCategoriesImage extends StatelessWidget {
  const UpdateCategoriesImage({required this.imageUrl, super.key});
final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.8),
        borderRadius: BorderRadius.circular(15),
        image:  DecorationImage(
          image: NetworkImage(
            imageUrl
          ),
          fit: BoxFit.cover, // Ensures the image fills the container
        ),
      ),
    );
  }
}