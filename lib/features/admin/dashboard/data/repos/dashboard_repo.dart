import '../../../../../core/service/graphql/api_result.dart';
import '../data-source/dashboard_data_source.dart';
import '../models/categories_number_response.dart';
import '../models/products_number_response.dart';
import '../models/users_number_response.dart';

class DashboardRepo {
  DashboardRepo(this._dataSource);

  final DashboardDataSource _dataSource;

  //! Get the number of categories
  Future<ApiResult<CategoriesNumberResponse>> getCategoriesNumber() async {
    try {
      final response = await _dataSource.getCategoriesNumber();
      return ApiResult.success(response);
    } catch (e) {
      return const ApiResult.failure('please try again later');
    }
  }

  //! Get the number of products
  Future<ApiResult<ProductsNumberResponse>> getProductsNumber() async {
    try {
      final response = await _dataSource.getProductsNumber();
      return ApiResult.success(response);
    } catch (e) {
      return const ApiResult.failure('please try again later');
    }
  }

  //! Get the number of users
  Future<ApiResult<UsersNumberResponse>> getUsersNumber()  async {
    try {
      final response = await _dataSource.getUsersNumber();
      return ApiResult.success(response);
    } catch (e) {
      return const ApiResult.failure('please try again later');
    }
  }
}
