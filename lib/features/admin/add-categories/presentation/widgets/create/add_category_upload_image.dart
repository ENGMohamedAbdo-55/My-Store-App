import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddCategoryUploadImage extends StatelessWidget {
  const AddCategoryUploadImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.8),
        borderRadius: BorderRadius.circular(15),
        image: const DecorationImage(
          image: NetworkImage(
            'https://images.unsplash.com/photo-1734378377292-212b58560ff8?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHw1fHx8ZW58MHx8fHx8',
          ),
          fit: BoxFit.cover, // Ensures the image fills the container
        ),
      ),
    );
  }
}
