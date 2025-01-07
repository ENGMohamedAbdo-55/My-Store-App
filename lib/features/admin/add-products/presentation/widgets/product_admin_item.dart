import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/common/widgets/custom_container_linear_admin.dart';
import 'package:my_store/core/common/widgets/text_app.dart';
import 'package:my_store/core/extensions/context_extensions.dart';
import 'package:my_store/core/styles/fonts/font_family_helper.dart';
import 'package:my_store/core/styles/fonts/font_weight_helper.dart';

class ProductAdminItem extends StatelessWidget {
  const ProductAdminItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.categoryName,
    required this.price,
  });
  final String imageUrl;
  final String title;
  final String categoryName;
  final String price;
  Widget build(BuildContext context) {
    return CustomContainerLinearAdmin(
      height: 250.h,
      width: 165.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //! Delete Button
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 10.w),
                child: Icon(
                  Icons.delete,
                  color: Colors.red,
                  size: 25,
                ),
              ),
              //! Update Button
              IconButton(
                onPressed: () {},
                padding: EdgeInsets.zero,
                icon: Icon(Icons.edit),
                color: Colors.green,
                iconSize: 25,
              )
            ],
          ),
          //! Show Image
          Flexible(
            child: Center(
              child: CachedNetworkImage(
                height: 200.h,
                width: 120.w,
                imageUrl: imageUrl,
                errorWidget: (context, url, error) => Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 70,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.h),
          //! Show Product Name
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
            ),
            child: TextApp(
              text: title,
              theme: context.textStyle.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeightHelper.bold,
                fontFamily: FontFamilyHelper.poppinsEnglish,
              ),
              maxLines: 1,
            ),
          ),
          SizedBox(height: 5.h),
          //! Category Name
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
            ),
            child: TextApp(
              text: categoryName,
              theme: context.textStyle.copyWith(
                fontSize: 13.sp,
                fontWeight: FontWeightHelper.medium,
                fontFamily: FontFamilyHelper.poppinsEnglish,
              ),
              maxLines: 1,
            ),
          ),
          //! Price
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
            ),
            child: TextApp(
              text: '\$ $price',
              theme: context.textStyle.copyWith(
                fontSize: 13.sp,
                fontWeight: FontWeightHelper.medium,
                fontFamily: FontFamilyHelper.poppinsEnglish,
              ),
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}
