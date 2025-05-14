part of 'update_categories_bloc.dart';

@freezed
class UpdateCategoriesState with _$UpdateCategoriesState {
  const factory UpdateCategoriesState.initial() = _Initial;
  const factory UpdateCategoriesState.loading() = LoadingState;
  const factory UpdateCategoriesState.success() = SuccessState;
  const factory UpdateCategoriesState.error({required String error}) = ErrorState;
}
