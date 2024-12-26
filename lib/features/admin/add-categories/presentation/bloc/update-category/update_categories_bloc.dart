import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../data/models/update_category_request_body.dart';
import '../../../data/repos/categories_admin_repos.dart';

part 'update_categories_event.dart';
part 'update_categories_state.dart';
part 'update_categories_bloc.freezed.dart';

class UpdateCategoriesBloc
    extends Bloc<UpdateCategoriesEvent, UpdateCategoriesState> {
  UpdateCategoriesBloc(this._repo) : super(_Initial()) {
    on<NewUpdateCategoryEvent>(updateCategories);
  }

  FutureOr<void> updateCategories(
    NewUpdateCategoryEvent event,
    Emitter<UpdateCategoriesState> emit,
  ) async{
    emit( UpdateCategoriesState.loading());
    final result = await _repo.updateCategory(body: event.body);
    result.when(
      success: (data) {
        emit(const UpdateCategoriesState.success());
      },
      failure: (error) {
        emit(UpdateCategoriesState.error(error: error));
      },
    );

  }
  final CategoriesAdminRepos _repo;
}
