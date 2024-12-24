import 'package:my_store/features/admin/add-categories/data/models/create_category_request_body.dart';
import 'package:my_store/features/admin/add-categories/data/models/create_category_response.dart';

import '../../../../../core/service/graphql/api_result.dart';
import '../../../../../core/utils/app_strings.dart';
import '../data-source/categories_admin_data_source.dart';
import '../models/get_all_categories_response.dart';

class CategoriesAdminRepos {
  CategoriesAdminRepos(this._dataSource);

  final CategoriesAdminDataSource _dataSource;

  //! Get all categories admin
  Future<ApiResult<CategoriesGetAllResponse>> getAllCategoriesAdmin() async {
    try {
      final response = await _dataSource.getAllCategoriesAdmin();
      return ApiResult.success(response);
    } catch (e) {
      return const ApiResult.failure(errMessage);
    }
  }
  Future<ApiResult<CreateCategoryResponse>> createCategory(CreateCategoryRequestBody body) async {
    try {
      final response = await _dataSource.createCategories(body);
      return ApiResult.success(response);
    } catch (e) {
      return const ApiResult.failure(errMessage);
    }
  }
}
