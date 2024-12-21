import 'package:my_store/core/service/graphql/api_service.dart';
import 'package:my_store/core/service/graphql/graphql_queries/admin/dashboard_queries.dart';
import 'package:my_store/features/admin/dashboard/data/models/categories_number_response.dart';
import 'package:my_store/features/admin/dashboard/data/models/products_number_response.dart';
import 'package:my_store/features/admin/dashboard/data/models/users_number_response.dart';

class DashboardDataSource {
  const DashboardDataSource(this._api);
  final ApiService _api;

  Future<CategoriesNumberResponse> getCategoriesNumber() async {
    final response = await _api.numberOfCategories(
      DashBoardQueries().numberOfCategoriesMapQuery(),
    );
    return response;
  }

  Future<ProductsNumberResponse> getProductsNumber() async {
    final response = await _api.numberOfProducts(
      DashBoardQueries().numberOfProductsMapQuery(),
    );
    return response;
  }

  Future<UsersNumberResponse> getUsersNumber() async {
    final response = await _api.numberOfUsers(
      DashBoardQueries().numberOfUsersMapQuery(),
    );
    return response;
  }
}
