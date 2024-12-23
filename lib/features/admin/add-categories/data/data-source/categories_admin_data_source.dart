import 'package:my_store/core/service/graphql/api_service.dart';
import 'package:my_store/core/service/graphql/graphql_queries/admin/categories_admin_query.dart';
import 'package:my_store/features/admin/add-categories/data/models/get_all_categories_response.dart';

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
}
