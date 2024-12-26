import 'package:my_store/features/admin/add-categories/data/models/create_category_request_body.dart';
import 'package:my_store/features/admin/add-categories/data/models/create_category_response.dart';

import '../../../../../core/service/graphql/api_service.dart';
import '../../../../../core/service/graphql/graphql_queries/admin/categories_admin_query.dart';
import '../models/get_all_categories_response.dart';

class CategoriesAdminDataSource {
  CategoriesAdminDataSource(this._graphQl);

  final ApiService _graphQl;

  //! get all categories admin
  Future<CategoriesGetAllResponse> getAllCategoriesAdmin() async {
    final response = await _graphQl.getAllCategories(
      CategoriesQueries().getAllCategoriesMapQuery(),
    );
    return response;
  }
  Future<CreateCategoryResponse> createCategories(CreateCategoryRequestBody body) async {
    final response = await _graphQl.createCategory(
      CategoriesQueries().createMapQuery(body: body),
    );
    return response;
  }
  //Delete category
  Future<void> deleteCategory(String categoryId) async {
    final response = await _graphQl.deleteCategory(
      CategoriesQueries().deleteMapQuery(categoryId: categoryId),
    );
    return response;
  }

//Update category
  // Future<void> updateCategory(UpdateCategoryRequestBody body) async {
  //   final response = await _graphql.updateCategory(
  //     CategoriesQueries().updateMapQuery(body: body),
  //   );
  //   return response;
  // }
}
