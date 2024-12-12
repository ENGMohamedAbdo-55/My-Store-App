import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_role_response.g.dart';
@JsonSerializable()
class UserRoleResponse {
  UserRoleResponse(this.userId, this.userRole);
factory UserRoleResponse.fromJson(Map<String, dynamic> json) => _$UserRoleResponseFromJson(json);
@JsonKey(name: 'id')
  final int? userId;
  @JsonKey(name: 'role')
  final String? userRole;
}