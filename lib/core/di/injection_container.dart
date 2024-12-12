import 'package:get_it/get_it.dart';
import 'package:my_store/features/auth/data/data-source/auth_data_source.dart';
import 'package:my_store/features/auth/data/repos/auth_repo.dart';
import 'package:my_store/core/app/app_cubit/app_cubit.dart';
import 'package:my_store/core/service/graphql/api_service.dart';
import 'package:my_store/core/service/graphql/dio_factory.dart';

final sl = GetIt.instance;
Future<void> setupInjector() async {
  await _initCore();
  await _initAuth();
}

Future<void> _initCore() async {
  final dio = DioFactory.getDio();
  sl
    ..registerFactory(AppCubit.new)
    ..registerLazySingleton<ApiService>(
      () => ApiService(dio),
    );
}

Future<void> _initAuth() async {
  sl
    ..registerFactory(() => AuthRepo(sl()))
    ..registerLazySingleton(() => AuthRepo(sl()))
    ..registerLazySingleton(() => AuthDataSource(sl()));
}
