import 'package:dio/dio.dart';
import '../../../features/admin/add-categories/data/models/get_all_categories_response.dart';
import '../../../features/admin/dashboard/data/models/categories_number_response.dart';
import '../../../features/admin/dashboard/data/models/products_number_response.dart';
import '../../../features/admin/dashboard/data/models/users_number_response.dart';
import '../../app/upload-image/model/upload_image_response.dart';
import '../../../features/auth/data/models/sign_up_response.dart';
import '../../../features/auth/data/models/login_response.dart';
import '../../../features/auth/data/models/user_role_response.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

const String baseUrl = 'https://api.escuelajs.co';
const String graphql = '/graphql';

@RestApi(baseUrl: baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(graphql)
  Future<LoginResponse> login(@Body() Map<String, dynamic> mutation);

  @POST(graphql)
  Future<SignUpResponse> signUp(
    @Body() Map<String, dynamic> mutation,
  );

  @GET('/api/v1/auth/profile')
  Future<UserRoleResponse> userRole();

  @POST('/api/v1/files/upload')
  Future<UploadImageResponse> uploadImage(
    @Body() FormData file,
  );
  @POST(graphql)
  Future<ProductsNumberResponse> numberOfProducts(
    @Body() Map<String, dynamic> query,
  );
  @POST(graphql)
  Future<CategoriesNumberResponse> numberOfCategories(
    @Body() Map<String, dynamic> query,
  );
  @POST(graphql)
  Future<UsersNumberResponse> numberOfUsers(
    @Body() Map<String, dynamic> query,
  );
  @POST(graphql)
  Future<CategoriesGetAllResponse> getAllCategories(
    @Body() Map<String, dynamic> query,
  );
}
