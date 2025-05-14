part of 'delete_product_bloc.dart';

@freezed
class DeleteProductState with _$DeleteProductState {
  const factory DeleteProductState.initial() = _Initial;
  const factory DeleteProductState.loading() = LoadingState;
  const factory DeleteProductState.success() = SuccessState;
  const factory DeleteProductState.failure({required String errorMessage}) = FailureState;
}