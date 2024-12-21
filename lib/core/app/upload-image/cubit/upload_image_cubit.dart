import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../repo/upload_image_repo.dart';
import '../../../utils/pick_image.dart';

part 'upload_image_state.dart';
part 'upload_image_cubit.freezed.dart';

class UploadImageCubit extends Cubit<UploadImageState> {
  UploadImageCubit(this._repo) : super(const UploadImageState.initial());
  final UploadImageRepo _repo;
  String getImageUrl = '';
//! Pick Image And Upload
  Future<void> uploadImage() async {
    final pickImage = await PickImageUtils().PickImage();
    if (pickImage == null) return;
    emit(const UploadImageState.loading());
    final result = await _repo.uploadImage(pickImage);
    result.when(
      success: (image) {
        getImageUrl = image.location ?? '';
        emit(const UploadImageState.success());
      },
      failure: (error) {
        emit(UploadImageState.error(error: error));
      },
    );
  }

  //! Remove Image
  void removeImage() {
    getImageUrl = '';
    emit(UploadImageState.removeImage(url: getImageUrl));
  }
}
