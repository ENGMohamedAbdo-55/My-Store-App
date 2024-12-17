import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_store/features/auth/data/models/sign_up_request_body.dart';
import 'package:my_store/features/auth/data/models/sign_up_response.dart';

import '../../../../core/service/graphql/api_service.dart';
import '../../../../core/service/graphql/graphql_queries/auth/auth_queries.dart';
import '../models/login_request_body.dart';
import '../models/login_response.dart';
import '../models/user_role_response.dart';

class AuthDataSource {
  const AuthDataSource(this._graphql);

  final ApiService _graphql;


  //! Login
  Future<LoginResponse> login({required LoginRequestBody body})async {
    final response =await _graphql.login(AuthQueries().loginMapQuery(body:  body));
    return response;
  }


//! User Role
  Future<UserRoleResponse> userRole(String token)async {
    final dio = Dio();
    dio.options.headers['Authorization'] = 'Bearer $token';
    final client = ApiService(dio);
    final response =await client.userRole();
    debugPrint('[USER ROLE] ====> ${response.userRole}');
    return response;
  }
  //SignUp
  Future<SignUpResponse> signUp({required SignUpRequestBody body}) async {
    final response =
        await _graphql.signUp(AuthQueries().signUpMapQuery(body: body));
    return response;
  }
}
