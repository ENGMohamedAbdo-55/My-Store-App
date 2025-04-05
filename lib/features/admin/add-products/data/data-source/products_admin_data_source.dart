

import 'package:my_store/core/service/graphql/api_service.dart';
import 'package:my_store/core/service/graphql/graphql_queries/admin/admin_products_queries.dart';
import 'package:my_store/features/admin/add-products/data/models/create_product_request_body.dart';
import 'package:my_store/features/admin/add-products/data/models/get_all_product_response.dart';

class ProductsAdminDataSource {
  const ProductsAdminDataSource(this._graphql);

  final ApiService _graphql;

  // Get All products admin
  Future<GetAllProductResponse> getAllProductsAdmin() async {
    final response = await _graphql
        .getAllProducts(ProductsQueries().getAllProductsMapQuery());
    return response;
  }

  // Create products admin
  Future<void> createProductsAdmin({
    required CreateProductRequestBody body,
  }) async {
    final response = await _graphql
        .createProduct(ProductsQueries().createProductMap(body: body));
    return response;
  }

  // // delete products
  Future<void> deleteProducts({
    required String productId,
  }) async {
    final response = await _graphql
        .deleteProduct(ProductsQueries().deleteMapQuery(productId: productId));
    return response;
  }
  

  // // Update products admin
  // Future<void> updateProductsAdmin({
  //   required UpdateProductRequestBody body,
  // }) async {
  //   final response = await _graphql
  //       .updateProduct(ProductsQueries().updateProductMap(body: body));
  //   return response;
  // }
}