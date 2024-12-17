import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_store/core/service/shared_pref/pref_keys.dart';
import 'package:my_store/core/service/shared_pref/shared_pref.dart';
import 'package:my_store/features/auth/data/models/login_request_body.dart';
import 'package:my_store/features/auth/data/models/sign_up_request_body.dart';
import 'package:my_store/features/auth/data/repos/auth_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_bloc_event.dart';
part 'auth_bloc_state.dart';
part 'auth_bloc_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  AuthBloc(this._repo, this.emailController, this.passwordController)
      : super(const _Initial()) {
    on<LoginEvent>(_login);
    on<SignUpEvent>(_signUp);
  }
  final AuthRepo _repo;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  //! Login
  FutureOr<void> _login(LoginEvent event, Emitter<AuthBlocState> emit) async {
    emit(const AuthBlocState.loading());
    final result = await _repo.login(
      LoginRequestBody(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      ),
    );
    await result.when(
      success: (loginData) async {
        //! User Token
        final token = loginData.data.login.accessToken ?? '';
        //! Save Token in SharedPreference
        await SharedPref().setString(
          PrefKeys.accessToken,
          token,
        );
        //! Get User Role
        final user = await _repo.userRole(
          token,
        );
        //! Save User Role
        await SharedPref().setString(
          PrefKeys.userRole,user.userRole ?? '',
        );
        //! Save User Id
        await SharedPref().setInt(
          PrefKeys.userId,
          user.userId ?? 0,
        );

        emit(AuthBlocState.success(userRole: user.userRole ?? ''));
      },
      failure: (error) {
        emit(AuthBlocState.error(error: error));
      },
    );
  }

    // signup and login to take user token
  FutureOr<void> _signUp(
    SignUpEvent event,
    Emitter<AuthBlocState> emit,
  ) async {
    emit(const AuthBlocState.loading());
    final result = await _repo.signUp(
      SignUpRequestBody(
        email: emailController.text.trim(),
        password: passwordController.text,
        avatar: event.imagUrl,
        name: nameController.text.trim(),
      ),
    );

    result.when(
      success: (signupData) {
        add(const AuthBlocEvent.login());
      },
      failure: (error) {
        emit(AuthBlocState.error(error: error));
      },
    );
  }
}
