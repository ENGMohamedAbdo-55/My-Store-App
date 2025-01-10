part of 'get_all_admin_products_bloc.dart';

@freezed
class GetAllAdminProductsState with _$GetAllAdminProductsState {
  const factory GetAllAdminProductsState.loading() = LoadingState;
  const factory GetAllAdminProductsState.success({required List<ProductGetAllModel> products}) = SuccessState;
  const factory GetAllAdminProductsState.error({required String error}) = ErrorState;
  const factory GetAllAdminProductsState.empty() = EmptyState;
}
