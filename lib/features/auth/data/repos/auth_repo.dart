import '../../../../core/language/lang_keys.dart';
import '../models/sign_up_request_body.dart';
import '../models/sign_up_response.dart';
import '../models/user_role_response.dart';

import '../../../../core/service/graphql/api_result.dart';
import '../data-source/auth_data_source.dart';
import '../models/login_request_body.dart';
import '../models/login_response.dart';

class AuthRepo {
  const AuthRepo(this._dataSource);
  final AuthDataSource _dataSource;

  //! Login
  Future<ApiResult<LoginResponse>> login(LoginRequestBody body) async {
    try {
      final response = await _dataSource.login(body: body);
      return ApiResult.success(response);
    } catch (e) {
      return const ApiResult.failure(LangKeys.loggedError);
    }
  }

//! Get User Role
  Future<UserRoleResponse> userRole(String token) async {
    final response = await _dataSource.userRole(token);
    return response;
  }

  //SignUp
  Future<ApiResult<SignUpResponse>> signUp(SignUpRequestBody body) async {
    try {
      final response = await _dataSource.signUp(body: body);

      return ApiResult.success(response);
    } catch (error) {
      return const ApiResult.failure('Please, try agian we have error');
    }
  }
}
