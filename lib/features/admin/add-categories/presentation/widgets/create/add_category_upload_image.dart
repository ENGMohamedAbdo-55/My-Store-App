import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/app/upload-image/cubit/upload_image_cubit.dart';
import 'package:my_store/core/common/toast/show_toast.dart';
import 'package:my_store/core/extensions/context_extensions.dart';
import 'package:my_store/core/language/lang_keys.dart';

class AddCategoryUploadImage extends StatelessWidget {
  const AddCategoryUploadImage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UploadImageCubit, UploadImageState>(
      listener: (context, state) {
        state.whenOrNull(
          success: () {
            ShowToast.showToastSuccessTop(
              message: context.translate(LangKeys.imageUploaded),
              seconds: 2,
            );
          },
          removeImage: (removeImage) {
            ShowToast.showToastSuccessTop(
              message: context.translate(LangKeys.imageRemoved),
              seconds: 2,
            );
          },
          error: (error) {
            ShowToast.showToastErrorTop(
              message: error,
              seconds: 2,
            );
          },
        );
      },
      builder: (context, state) {
        final cubit = context.read<UploadImageCubit>();
        return state.maybeWhen(
          loading: () {
            return Container(
              height: 120.h,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.8),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            );
          },
          orElse: () {
            if (cubit.getImageUrl.isNotEmpty) {
                return Container(
                  height: 120.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: NetworkImage(cubit.getImageUrl),
                      fit: BoxFit.fill,
                    ),
                  ),
              
                );
            }else{
                return InkWell(
              onTap: () {
                context.read<UploadImageCubit>().uploadImage();
              },
              child: Container(
                height: 120.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(
                  Icons.add_a_photo_outlined,
                  color: Colors.white,
                  size: 50,
                ),
              ),
            );
            }
          
          },
        );
      },
    );
  }
}
