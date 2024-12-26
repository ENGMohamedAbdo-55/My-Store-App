import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/app/upload-image/cubit/upload_image_cubit.dart';
import '../../../../../../core/common/toast/show_toast.dart';
import '../../../../../../core/extensions/context_extensions.dart';
import '../../../../../../core/language/lang_keys.dart';

class UpdateCategoriesImage extends StatelessWidget {
  const UpdateCategoriesImage({required this.imageUrl, super.key});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UploadImageCubit, UploadImageState>(
      listener: (context, state) {
state.whenOrNull(
        success: () {
          ShowToast.showToastSuccessTop(
            message: context.translate(LangKeys.imageUploaded),
          );
        },
        error: (error) {
          ShowToast.showToastErrorTop(
            message: error,
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
            return InkWell(
              onTap: () {
                cubit.removeImage();
              },
              child: Stack(children: [
                Container(
                  height: 120.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: NetworkImage(
                        cubit.getImageUrl.isEmpty
                            ? imageUrl
                            : cubit.getImageUrl,
                      ),
                  
                    ),
                  ),
                ),
                if (cubit.getImageUrl.isEmpty)
                  Container(
                    height: 120.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.add_a_photo_outlined,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
              ]),
            );
          },
        );
      },
    );
  }
}
