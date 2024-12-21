import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../data/repos/dashboard_repo.dart';

part 'categories_number_event.dart';
part 'categories_number_state.dart';
part 'categories_number_bloc.freezed.dart';

class CategoriesNumberBloc
    extends Bloc<CategoriesNumberEvent, CategoriesNumberState> {
  CategoriesNumberBloc(this._repo) : super(const CategoriesNumberState.loading()) {
    on<GetCategoriesNumberEvent>(_getCategoriesNumber);
  }
final DashboardRepo _repo;
  FutureOr<void> _getCategoriesNumber(
    CategoriesNumberEvent event,
    Emitter<CategoriesNumberState> emit,
  ) async{
    emit(const CategoriesNumberState.loading());
    final result = await _repo.getCategoriesNumber();
    result.when(success: (categoriesData) {
      emit(CategoriesNumberState.success(
        categoriesNumber: categoriesData.categoriesNumbers,
      ));
    }, failure: (error) {
      emit(CategoriesNumberState.error(error: error));
    });

  }
}
