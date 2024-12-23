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
}
