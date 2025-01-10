import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:my_store/features/admin/add-products/data/data-source/products_admin_data_source.dart';
import 'package:my_store/features/admin/add-products/data/repos/products_admin_repo.dart';
import 'package:my_store/features/admin/add-products/presentation/bloc/products-bloc/get_all_admin_products_bloc.dart';
import '../../features/admin/add-categories/presentation/bloc/create-category/create_category_bloc.dart';
import '../../features/admin/add-categories/presentation/bloc/delete-category/delete_category_bloc.dart';
import '../../features/admin/add-categories/presentation/bloc/update-category/update_categories_bloc.dart';
import '../app/app_cubit/app_cubit.dart';
import '../app/upload-image/cubit/upload_image_cubit.dart';
import '../app/upload-image/data-source/upload_image_data_source.dart';
import '../app/upload-image/repo/upload_image_repo.dart';
import '../service/graphql/api_service.dart';
import '../service/graphql/dio_factory.dart';
import '../../features/admin/add-categories/data/data-source/categories_admin_data_source.dart';
import '../../features/admin/add-categories/data/repos/categories_admin_repos.dart';
import '../../features/admin/add-categories/presentation/bloc/get-all-categories/get_all_admin_categories_bloc.dart';
import '../../features/admin/dashboard/data/data-source/dashboard_data_source.dart';
import '../../features/admin/dashboard/data/repos/dashboard_repo.dart';
import '../../features/admin/dashboard/presentation/bloc/categories-number/categories_number_bloc.dart';
import '../../features/admin/dashboard/presentation/bloc/products_number/products_number_bloc.dart';
import '../../features/admin/dashboard/presentation/bloc/usres-number/users_number_bloc.dart';
import '../../features/auth/data/data-source/auth_data_source.dart';
import '../../features/auth/data/repos/auth_repo.dart';
import '../../features/auth/presentation/bloc/auth_bloc_bloc.dart';

final sl = GetIt.instance;
Future<void> setupInjector() async {
  await _initCore();
  await _initAuth();
  await _initDashboard();
  await _initCategoriesAdmin();
  await _initProductsAdmin();
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

Future<void> _initCategoriesAdmin() async {
  sl
    ..registerLazySingleton(() => CategoriesAdminRepos(sl()))
    ..registerLazySingleton(() => CategoriesAdminDataSource(sl()))
    ..registerFactory(() => GetAllAdminCategoriesBloc(sl()))
    ..registerFactory(() => CreateCategoryBloc(sl()))
    ..registerFactory(() => DeleteCategoryBloc(sl()))
    ..registerFactory(() => UpdateCategoriesBloc(sl()));
}

Future<void> _initProductsAdmin() async {
  sl
    ..registerLazySingleton(() => ProductsAdminRepo(sl()))
    ..registerLazySingleton(() => ProductsAdminDataSource(sl()))
    ..registerFactory(() => GetAllAdminProductsBloc(sl()));
}
