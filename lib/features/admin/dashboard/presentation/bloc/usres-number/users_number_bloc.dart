import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../data/repos/dashboard_repo.dart';
part 'users_number_event.dart';
part 'users_number_state.dart';
part 'users_number_bloc.freezed.dart';

class UsersNumberBloc extends Bloc<UsersNumberEvent, UsersNumberState> {
  UsersNumberBloc(this._repo) : super(const UsersNumberState.loading()) {
    on<GetUsersNumberEvent>(_getUsersNumber);
  }
  final DashboardRepo _repo;
  FutureOr<void> _getUsersNumber(
    UsersNumberEvent event,
    Emitter<UsersNumberState> emit,
  ) async {
    emit(const UsersNumberState.loading());
    final result = await _repo.getUsersNumber();
    result.when(
      success: (usersData) {
        emit(
          UsersNumberState.success(
            number: usersData.usersNumbers,
          ),
        );
      },
      failure: (error) {
        emit(UsersNumberState.error(error: error));
      },
    );
  }
}
