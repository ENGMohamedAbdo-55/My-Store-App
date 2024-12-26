import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../data/models/create_category_request_body.dart';
import '../../../data/repos/categories_admin_repos.dart';

part 'create_category_event.dart';
part 'create_category_state.dart';
part 'create_category_bloc.freezed.dart';

class CreateCategoryBloc
    extends Bloc<CreateCategoryEvent, CreateCategoryState> {
  CreateCategoryBloc(this._repos) : super(_Initial()) {
    on<NewCreateCategoryEvent>(createCategory);
  }
  final CategoriesAdminRepos _repos;
  FutureOr<void> createCategory(
    NewCreateCategoryEvent event,
    Emitter<CreateCategoryState> emit,
  ) async {
    
    emit(const CreateCategoryState.loading());
    final result = await _repos.createCategory(body: event.body);
    result.when(
      success: (response) {
        emit(CreateCategoryState.success());
      },
      failure: (error) {
        emit(CreateCategoryState.error(error: error));
      },
    );
   }
}
