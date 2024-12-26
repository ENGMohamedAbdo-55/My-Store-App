import '../models/create_category_request_body.dart';
import '../models/create_category_response.dart';
import '../models/update_category_request_body.dart';

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
  Future<ApiResult<CreateCategoryResponse>> createCategory({required CreateCategoryRequestBody body}) async {
    try {
      final response = await _dataSource.createCategories(body);
      return ApiResult.success(response);
    } catch (e) {
      return const ApiResult.failure(errMessage);
    }
  }
    // Delete Category
  Future<ApiResult<void>> deleteCategory({
    required String categoryId,
  }) async {
    try {
      final response = await _dataSource.deleteCategory(categoryId);
      return ApiResult.success(response);
    } catch (e) {
      return const ApiResult.failure(errMessage);
    }
  }

  //  Update Category
  Future<ApiResult<void>> updateCategory({
    required UpdateCategoryRequestBody body,
  }) async {
    try {
      final response = await _dataSource.updateCategory(body);
      return ApiResult.success(response);
    } catch (e) {
      return const ApiResult.failure(errMessage);
    }
  }
}
