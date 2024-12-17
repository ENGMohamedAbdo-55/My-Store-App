import 'package:image_picker/image_picker.dart';
import 'package:my_store/core/app/upload-image/data-source/upload_image_data_source.dart';
import 'package:my_store/core/app/upload-image/model/upload_image_response.dart';
import 'package:my_store/core/language/lang_keys.dart';
import 'package:my_store/core/service/graphql/api_result.dart';

class UploadImageRepo {
  UploadImageRepo(this._dataSource);

final UploadImageDataSource _dataSource;

Future<ApiResult<UploadImageResponse>>uploadImage(XFile imageFile)async
{
  try {
    final response = await _dataSource.uploadImage(imageFile: imageFile);
    return ApiResult.success(response);
  } catch (e) {
    return const ApiResult.failure(LangKeys.loggedError);
  }

}
}
