import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdateProductImages extends StatelessWidget {
  const UpdateProductImages({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 3,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {},
          child: Stack(
            children: [
              Container(
                height: 90.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(15),
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://images.unsplash.com/photo-1735948055457-8d816fb80a87?q=80&w=1771&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                height: 90.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Icon(
                  Icons.add_a_photo_outlined,
                  color: Colors.white,
                  size: 50,
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => SizedBox(height: 6.h),
    );
  }
}
