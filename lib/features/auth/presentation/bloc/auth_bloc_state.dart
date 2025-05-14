part of 'auth_bloc_bloc.dart';

@freezed
class AuthBlocState with _$AuthBlocState {
  const factory AuthBlocState.initial() = _Initial;
  const factory AuthBlocState.loading() = LoadingState;
  const factory AuthBlocState.error({required String error}) = ErrorState;  
  const factory AuthBlocState.success({required String userRole}) = SuccessState;
}
