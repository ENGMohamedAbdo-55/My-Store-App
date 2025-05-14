import 'dart:async';
import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_store/features/admin/add-products/data/models/get_all_product_response.dart';
import 'package:my_store/features/admin/add-products/data/repos/products_admin_repo.dart';

part 'get_all_admin_products_event.dart';
part 'get_all_admin_products_state.dart';
part 'get_all_admin_products_bloc.freezed.dart';

class GetAllAdminProductsBloc
    extends Bloc<GetAllAdminProductsEvent, GetAllAdminProductsState> {
  GetAllAdminProductsBloc(this._repo)
      : super(GetAllAdminProductsState.loading()) {
    on<FetchAllAdminProductsEvent>(getAllProducts);
  }
  final ProductsAdminRepo _repo;
  FutureOr<void> getAllProducts(
    FetchAllAdminProductsEvent event,
    Emitter<GetAllAdminProductsState> emit,
  ) async {
    if (event.isNotLoading) {
      emit(const GetAllAdminProductsState.loading());
    }
    final result = await _repo.getAllProductsAdmin();
    result.when(
      success: (data) {
        if (data.productGetAllList.isEmpty) {
          emit(const GetAllAdminProductsState.empty());
        } else {
          emit(GetAllAdminProductsState.success(
              products: data.productGetAllList));
        }
      },
      failure: (error) {
        emit(GetAllAdminProductsState.error(error: error));
      },
    );
  }
}
