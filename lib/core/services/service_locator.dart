import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:review_app/src/features/auth/domain/usecase/register_use_case.dart';
import 'package:review_app/src/features/auth/presentation/logic/login/login_cubit.dart';
import 'package:review_app/src/features/favorite/data/datasource/favorite_api_services.dart';
import 'package:review_app/src/features/favorite/data/datasource/favorite_remote_ds.dart';
import 'package:review_app/src/features/favorite/domain/repository/favorite_repository.dart';
import 'package:review_app/src/features/favorite/domain/usecase/get_favorite_use_case.dart';
import 'package:review_app/src/features/favorite/presentation/logic/get_favorite_cubit.dart';
import 'package:review_app/src/features/home/data/datasource/home_api_service.dart';
import 'package:review_app/src/features/home/data/datasource/home_remote_ds.dart';
import 'package:review_app/src/features/home/domain/repository/home_repository.dart';
import 'package:review_app/src/features/home/domain/usecase/get_all_places.dart';
import 'package:review_app/src/features/home/domain/usecase/get_nears_places.dart';
import 'package:review_app/src/features/home/domain/usecase/get_new_places.dart';
import 'package:review_app/src/features/home/domain/usecase/get_top_rated_places.dart';
import 'package:review_app/src/features/home/presentation/logic/cubit/home_cubit.dart';
import 'package:review_app/src/features/place_details/data/datasource/place_datails_api_service.dart';
import 'package:review_app/src/features/place_details/data/datasource/place_details_remote_data_source.dart';
import 'package:review_app/src/features/place_details/domain/repository/place_details_repository.dart';
import 'package:review_app/src/features/place_details/domain/usecase/add_favorite_place_uc.dart';
import 'package:review_app/src/features/place_details/domain/usecase/get_place_details_uc.dart';
import 'package:review_app/src/features/place_details/presentation/logic/cubit/add_favorite_place_cubit.dart';
import 'package:review_app/src/features/place_details/presentation/logic/place_details/place_details_cubit.dart';
import 'package:review_app/src/features/search/data/datasourse/search_api_service.dart';
import 'package:review_app/src/features/search/data/datasourse/search_remote_ds.dart';
import 'package:review_app/src/features/search/domain/repository/search_repository.dart';
import 'package:review_app/src/features/search/domain/usecase/get_search_results.dart';
import 'package:review_app/src/features/search/presentation/logic/cubit/search_cubit.dart';
import '../../src/features/auth/data/datasource/auth_api_services.dart';
import '../../src/features/auth/data/datasource/auth_remote_ds.dart';
import '../../src/features/auth/domain/repository/auth_repository.dart';
import '../../src/features/auth/domain/usecase/login_use_case.dart';
import '../../src/features/auth/presentation/logic/register/register_cubit.dart';
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

  getIt.registerLazySingleton<IPlaceDetailsApiService>(
      () => PlaceDetailsApiServiceImpl(getIt<ApiConsumer>()));

  getIt.registerLazySingleton<FavoriteApiServices>(
      () => FavoriteApiServicesImpl(getIt<ApiConsumer>()));

  getIt.registerLazySingleton<SearchApiService>(
      () => SearchApiServiceImpl(getIt<ApiConsumer>()));

  /// --DataSources-- ///
  getIt.registerLazySingleton<IAuthRemoteDs>(
      () => AuthRemoteDsImpl(getIt<AuthApiServices>()));
  getIt.registerLazySingleton<IHomeRemoteDs>(
      () => HomeRemoteDsImpl(getIt<HomeApiService>()));
  getIt.registerLazySingleton<IPlaceDetailsDS>(
      () => PlaceDetailsDSImpl(getIt<IPlaceDetailsApiService>()));

  getIt.registerLazySingleton<IFavoriteRemoteDs>(
      () => FavoriteRemoteDsImpl(apiService: getIt<FavoriteApiServices>()));

  getIt.registerLazySingleton<ISearchRemoteDataSource>(
      () => SearchRemoteDataSource(getIt<SearchApiService>()));

  /// -- Repositories -- ///

  getIt.registerLazySingleton<IAuthRepository>(
      () => AuthRepositoryImpl(getIt<IAuthRemoteDs>()));
  getIt.registerLazySingleton<IHomeRepository>(
      () => HomeRepositoryImpl(getIt<IHomeRemoteDs>()));

  getIt.registerLazySingleton<IPlaceDetailsRepository>(
      () => PlaceDetailsRepositoryImpl(getIt<IPlaceDetailsDS>()));

  getIt.registerLazySingleton<IFavoriteRepository>(
      () => FavoriteRepositoryImpl(getIt<IFavoriteRemoteDs>()));
  getIt.registerLazySingleton<ISearchRepository>(
      () => SearchRepository(getIt<ISearchRemoteDataSource>()));

  /// -- UseCases -- ///
  getIt.registerLazySingleton<LoginUseCase>(
      () => LoginUseCase(getIt<IAuthRepository>()));
  getIt.registerLazySingleton<RegisterUseCase>(
      () => RegisterUseCase(getIt<IAuthRepository>()));
  getIt.registerLazySingleton<GetNewPlacesUC>(
      () => GetNewPlacesUC(getIt<IHomeRepository>()));
  getIt.registerLazySingleton<GetTopRatedPlacesUC>(
      () => GetTopRatedPlacesUC(getIt<IHomeRepository>()));
  getIt.registerLazySingleton<GetNearstPlacesUC>(
      () => GetNearstPlacesUC(getIt<IHomeRepository>()));
  getIt.registerLazySingleton<GetAllPlacesUC>(
      () => GetAllPlacesUC(getIt<IHomeRepository>()));

  getIt.registerLazySingleton<GetPlaceDetailsUc>(
      () => GetPlaceDetailsUc(getIt<IPlaceDetailsRepository>()));
  getIt.registerLazySingleton<AddFavoritePlaceUc>(
      () => AddFavoritePlaceUc(getIt<IPlaceDetailsRepository>()));

  getIt.registerLazySingleton<GetFavoriteUseCase>(
      () => GetFavoriteUseCase(getIt<IFavoriteRepository>()));

  getIt.registerLazySingleton<GetSearchResults>(
      () => GetSearchResults(getIt<ISearchRepository>()));

  // Cubits //
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt()));
  getIt.registerLazySingleton<RegisterCubit>(() => RegisterCubit(getIt()));
  getIt.registerLazySingleton<HomeCubit>(() => HomeCubit(
      getIt<GetNewPlacesUC>(),
      getIt<GetTopRatedPlacesUC>(),
      getIt<GetNearstPlacesUC>(),
      getIt<GetAllPlacesUC>()));

  getIt.registerFactory<PlaceDetailsCubit>(
      () => PlaceDetailsCubit(getIt<GetPlaceDetailsUc>()));

  getIt.registerFactory<GetFavoriteCubit>(() => GetFavoriteCubit(getIt()));
  getIt.registerFactory<AddFavoritePlaceCubit>(
      () => AddFavoritePlaceCubit(getIt<AddFavoritePlaceUc>()));

  getIt.registerFactory<SearchCubit>(() => SearchCubit(getIt()));
}
