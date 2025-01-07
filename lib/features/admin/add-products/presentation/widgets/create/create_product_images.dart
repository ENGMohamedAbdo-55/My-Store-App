import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class createProductImages extends StatelessWidget {
  const createProductImages({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 3,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {},
          child: Container(
            height: 90.h,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.8),
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Icon(
              Icons.add_a_photo_outlined,
              color: Colors.white,
              size: 50,
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => SizedBox(height: 6.h),
    );
  }
}
