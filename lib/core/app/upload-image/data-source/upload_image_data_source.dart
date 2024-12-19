// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_store/core/app/upload-image/model/upload_image_response.dart';
import 'package:my_store/core/service/graphql/api_service.dart';

class UploadImageDataSource {
  ApiService _api;
  UploadImageDataSource(
    this._api,
  );
  Future<UploadImageResponse> uploadImage({required XFile imageFile}) async {
    final fromData = FormData.fromMap(
        {'file': await MultipartFile.fromFile(imageFile.path)});
    final response = await _api.uploadImage(fromData);
    return response;
  }
}
