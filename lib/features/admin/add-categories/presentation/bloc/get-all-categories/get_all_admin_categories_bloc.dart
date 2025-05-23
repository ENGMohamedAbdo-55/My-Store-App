import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/get_all_categories_response.dart';
import '../../../data/repos/categories_admin_repos.dart';

part 'get_all_admin_categories_bloc.freezed.dart';
part 'get_all_admin_categories_event.dart';
part 'get_all_admin_categories_state.dart';

class GetAllAdminCategoriesBloc
    extends Bloc<GetAllAdminCategoriesEvent, GetAllAdminCategoriesState> {
  GetAllAdminCategoriesBloc(this._repos)
      : super(const GetAllAdminCategoriesState.loading()) {
    on<FetchAdminCategoriesEvent>(_fetchAdminCategories);
  }
  final CategoriesAdminRepos _repos;
  FutureOr<void> _fetchAdminCategories(
    FetchAdminCategoriesEvent event,
    Emitter<GetAllAdminCategoriesState> emit,
  ) async {
    if(event.isNotLoading){
      emit(const GetAllAdminCategoriesState.loading());
    }
    emit(const GetAllAdminCategoriesState.loading());
    final result = await _repos.getAllCategoriesAdmin();
    result.when(
      success: (categoryData) {
        if (categoryData.categoriesList.isEmpty) {
          emit(const GetAllAdminCategoriesState.empty());
        } else {
          emit(
            GetAllAdminCategoriesState.success(categoriesModel: categoryData),
          );
        }
        emit(
          GetAllAdminCategoriesState.success(categoriesModel: categoryData),
        );
      },
      failure: (error) {
        emit(GetAllAdminCategoriesState.error(error: error));
      },
    );
  }
}
