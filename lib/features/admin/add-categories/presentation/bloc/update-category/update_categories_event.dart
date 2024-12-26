part of 'update_categories_bloc.dart';

@freezed
class UpdateCategoriesEvent with _$UpdateCategoriesEvent {
  const factory UpdateCategoriesEvent.started() = _Started;
  const factory UpdateCategoriesEvent.updateCategory({ required UpdateCategoryRequestBody body}) = NewUpdateCategoryEvent;
}