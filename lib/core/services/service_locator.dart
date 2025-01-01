import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:review_app/src/features/auth/domain/usecase/register_use_case.dart';
import 'package:review_app/src/features/auth/presentaion/logic/login/login_cubit.dart';
import 'package:review_app/src/features/home/data/datasource/home_api_service.dart';
import 'package:review_app/src/features/home/data/datasource/home_remote_ds.dart';
import 'package:review_app/src/features/home/domain/repository/home_repository.dart';
import 'package:review_app/src/features/home/domain/usecase/get_new_places.dart';
import 'package:review_app/src/features/home/domain/usecase/get_top_rated_places.dart';
import 'package:review_app/src/features/home/presentation/logic/cubit/home_cubit.dart';
import '../../src/features/auth/data/datasource/auth_api_services.dart';
import '../../src/features/auth/data/datasource/auth_remote_ds.dart';
import '../../src/features/auth/domain/repository/auth_repository.dart';
import '../../src/features/auth/domain/usecase/login_use_case.dart';
import '../../src/features/auth/presentaion/logic/register/register_cubit.dart';
import '../app_cubit/app_cubit.dart';
import '../data/api/api_consumer.dart';
import '../data/api/dio_consumer.dart';
import '../data/cached/cache_helper.dart';

final GetIt getIt = GetIt.instance;
void setupLocator() {
  ///! FOR APP CUBIT ///
  getIt.registerFactory<AppCubit>(() => AppCubit());

  getIt.registerSingleton<CacheHelper>(CacheHelper());
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt
      .registerLazySingleton<ApiConsumer>(() => DioConsumer(dio: getIt<Dio>()));
  getIt.registerLazySingleton<ImagePicker>(() => ImagePicker());

//Api Services //
  getIt.registerLazySingleton<AuthApiServices>(
      () => AuthApiServicesImpl(getIt<ApiConsumer>()));

  getIt.registerLazySingleton<HomeApiService>(
      () => HomeApiServiceImpl(getIt<ApiConsumer>()));

//DataSources //
  getIt.registerLazySingleton<IAuthRemoteDs>(
      () => AuthRemoteDsImpl(getIt<AuthApiServices>()));
  getIt.registerLazySingleton<IHomeRemoteDs>(
      () => HomeRemoteDsImpl(getIt<HomeApiService>()));

//Repositories //

  getIt.registerLazySingleton<IAuthRepository>(
      () => AuthRepositoryImpl(getIt<IAuthRemoteDs>()));
  getIt.registerLazySingleton<IHomeRepository>(
      () => HomeRepositoryImpl(getIt<IHomeRemoteDs>()));

// UseCases //
  getIt.registerLazySingleton<LoginUseCase>(
      () => LoginUseCase(getIt<IAuthRepository>()));
  getIt.registerLazySingleton<RegisterUseCase>(
      () => RegisterUseCase(getIt<IAuthRepository>()));
  getIt.registerLazySingleton<GetNewPlacesUC>(
      () => GetNewPlacesUC(getIt<IHomeRepository>()));
  getIt.registerLazySingleton<GetTopRatedPlacesUC>(
      () => GetTopRatedPlacesUC(getIt<IHomeRepository>()));

  // Cubits //
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt()));
  getIt.registerLazySingleton<RegisterCubit>(() => RegisterCubit(getIt()));
  getIt.registerLazySingleton<HomeCubit>(
      () => HomeCubit(getIt<GetNewPlacesUC>(), getIt<GetTopRatedPlacesUC>()));
}
