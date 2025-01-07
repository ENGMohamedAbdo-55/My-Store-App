import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/repos/dashboard_repo.dart';

part 'products_number_bloc.freezed.dart';
part 'products_number_event.dart';
part 'products_number_state.dart';

class ProductsNumberBloc
    extends Bloc<ProductsNumberEvent, ProductsNumberState> {
  ProductsNumberBloc(this._repo) : super(const ProductsNumberState.loading()) {
    on<GetProductsNumberEvent>(_getProductsNumber);
  }
  final DashboardRepo _repo;
  FutureOr<void> _getProductsNumber(
    ProductsNumberEvent event,
    Emitter<ProductsNumberState> emit,
  ) async {
    emit(const ProductsNumberState.loading());
    final result = await _repo.getProductsNumber();
    result.when(success: (productsData) {
      emit(ProductsNumberState.success(
        productsNumber: productsData.produtcsNumbers,
      ));
    }, failure: (error) {
      emit(ProductsNumberState.error(error: error));
    });
  }
}
