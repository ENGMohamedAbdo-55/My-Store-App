import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../features/admin/dashboard/data/data-source/dashboard_data_source.dart';
import '../../features/admin/dashboard/data/repos/dashboard_repo.dart';
import '../../features/admin/dashboard/presentation/bloc/categories-number/categories_number_bloc.dart';
import '../../features/admin/dashboard/presentation/bloc/products_number/products_number_bloc.dart';
import '../../features/admin/dashboard/presentation/bloc/usres-number/users_number_bloc.dart';
import '../../features/auth/presentation/bloc/auth_bloc_bloc.dart';
import '../app/upload-image/cubit/upload_image_cubit.dart';
import '../app/upload-image/data-source/upload_image_data_source.dart';
import '../app/upload-image/repo/upload_image_repo.dart';
import '../../features/auth/data/data-source/auth_data_source.dart';
import '../../features/auth/data/repos/auth_repo.dart';
import '../app/app_cubit/app_cubit.dart';
import '../service/graphql/api_service.dart';
import '../service/graphql/dio_factory.dart';

final sl = GetIt.instance;
Future<void> setupInjector() async {
  await _initCore();
  await _initAuth();
  await _initDashboard();
}

Future<void> _initCore() async {
  final dio = DioFactory.getDio();
  final navigatorKey = GlobalKey<NavigatorState>();
  sl
    ..registerFactory(AppCubit.new)
    ..registerLazySingleton<ApiService>(
      () => ApiService(dio),
    )
    ..registerSingleton<GlobalKey<NavigatorState>>(navigatorKey)
    ..registerFactory(() => UploadImageCubit(sl()))
    ..registerLazySingleton(() => UploadImageRepo(sl()))
    ..registerLazySingleton(() => UploadImageDataSource(sl()));
}

Future<void> _initAuth() async {
  sl
    ..registerFactory(() => AuthBloc(sl()))
    ..registerLazySingleton(() => AuthRepo(sl()))
    ..registerLazySingleton(() => AuthDataSource(sl()));
}

Future<void> _initDashboard() async {
  sl
    ..registerLazySingleton(() => DashboardDataSource(sl()))
    ..registerLazySingleton(() => DashboardRepo(sl()))
    ..registerFactory(() => ProductsNumberBloc(sl()))
    ..registerFactory(() => CategoriesNumberBloc(sl()))
    ..registerFactory(() => UsersNumberBloc(sl()));
}
