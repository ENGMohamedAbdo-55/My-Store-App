import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_store/features/admin/add-categories/data/repos/categories_admin_repos.dart';

part 'delete_category_event.dart';
part 'delete_category_state.dart';
part 'delete_category_bloc.freezed.dart';

class DeleteCategoryBloc
    extends Bloc<DeleteCategoryEvent, DeleteCategoryState> {
  DeleteCategoryBloc(this._repos) : super(_Initial()) {
    on<RemoveCategoryEvent>(deleteCategories);
  }
final CategoriesAdminRepos _repos ;
  FutureOr<void> deleteCategories(
    RemoveCategoryEvent event,
    Emitter<DeleteCategoryState> emit,
  ) async{
    emit( DeleteCategoryState.loading(categoryId:  event.categoryId));
    final result = await _repos.deleteCategory(categoryId: event.categoryId);
    result.when(
      success: (data) {
        emit(const DeleteCategoryState.success());
      },
      failure: (error) {
        emit(DeleteCategoryState.error(error: error));
      },
    );
  }
}
