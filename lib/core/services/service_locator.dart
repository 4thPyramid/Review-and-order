import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:review_app/src/features/auth/domain/usecase/logout_use_case.dart';
import 'package:review_app/src/features/auth/domain/usecase/register_use_case.dart';
import 'package:review_app/src/features/auth/presentation/logic/forget_password/forget_password_cubit.dart';
import 'package:review_app/src/features/auth/presentation/logic/login/login_cubit.dart';
import 'package:review_app/src/features/auth/presentation/logic/logout/logout_cubit.dart';
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
import 'package:review_app/src/features/home/domain/usecase/update_location.dart';
import 'package:review_app/src/features/home/presentation/logic/cubit/home_cubit.dart';
import 'package:review_app/src/features/place_details/data/datasource/place_datails_api_service.dart';
import 'package:review_app/src/features/place_details/data/datasource/place_details_remote_data_source.dart';
import 'package:review_app/src/features/place_details/domain/repository/place_details_repository.dart';
import 'package:review_app/src/features/place_details/domain/usecase/add_commit_rating_uc.dart';
import 'package:review_app/src/features/place_details/domain/usecase/add_favorite_place_uc.dart';
import 'package:review_app/src/features/place_details/domain/usecase/get_place_details_uc.dart';
import 'package:review_app/src/features/place_details/presentation/logic/cubit/add_commit_cubit.dart';
import 'package:review_app/src/features/place_details/presentation/logic/cubit/add_favorite_place_cubit.dart';
import 'package:review_app/src/features/place_details/presentation/logic/place_details/place_details_cubit.dart';
import 'package:review_app/src/features/profile/domain/usecase/get_profile_photo_uc.dart';
import 'package:review_app/src/features/profile/domain/usecase/update_profile_photo.dart';
import 'package:review_app/src/features/profile/domain/usecase/update_profile_uc.dart';
import 'package:review_app/src/features/profile/presentation/logic/profile_cubit.dart';
import 'package:review_app/src/features/search/data/datasourse/search_api_service.dart';
import 'package:review_app/src/features/search/data/datasourse/search_remote_ds.dart';
import 'package:review_app/src/features/search/domain/repository/search_repository.dart';
import 'package:review_app/src/features/search/domain/usecase/get_search_results.dart';
import 'package:review_app/src/features/search/presentation/logic/cubit/search_cubit.dart';
import '../../src/features/auth/data/datasource/auth_api_services.dart';
import '../../src/features/auth/data/datasource/auth_remote_ds.dart';
import '../../src/features/auth/domain/repository/auth_repository.dart';
import '../../src/features/auth/domain/usecase/forget_password_use_case.dart';
import '../../src/features/auth/domain/usecase/login_use_case.dart';
import '../../src/features/auth/presentation/logic/register/register_cubit.dart';
import '../../src/features/profile/data/datasource/profile_api_service.dart';
import '../../src/features/profile/data/datasource/profile_remote_ds.dart';
import '../../src/features/profile/domain/repository/profile_repository.dart';
import '../../src/features/profile/domain/usecase/delete_account_uc.dart';
import '../../src/features/profile/presentation/logic/delete_account_cubit.dart';
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

  getIt.registerLazySingleton<ProfileApiService>(
      () => ProfileApiServiceImpl(getIt()));

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

  getIt.registerLazySingleton<ProfileRemoteDs>(
      () => ProfileRemoteDSImpl(getIt()));

  /// -- Repositories -- ///

  getIt.registerLazySingleton<IAuthRepository>(
      () => AuthRepositoryImpl(getIt<IAuthRemoteDs>()));
  getIt.registerLazySingleton<IHomeRepository>(
      () => HomeRepositoryImpl(getIt<IHomeRemoteDs>()));

  getIt.registerLazySingleton<IPlaceDetailsRepository>(
      () => PlaceDetailsRepositoryImpl(getIt<IPlaceDetailsDS>()));
  getIt.registerLazySingleton<ProfileRepository>(
      () => ProfileRepositoryImpl(getIt()));
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
  getIt.registerLazySingleton<UpdateLocationUC>(
      () => UpdateLocationUC(getIt<IHomeRepository>()));

  getIt.registerLazySingleton<GetPlaceDetailsUc>(
      () => GetPlaceDetailsUc(getIt<IPlaceDetailsRepository>()));
  getIt.registerLazySingleton<AddFavoritePlaceUc>(
      () => AddFavoritePlaceUc(getIt<IPlaceDetailsRepository>()));

  getIt.registerLazySingleton<GetFavoriteUseCase>(
      () => GetFavoriteUseCase(getIt<IFavoriteRepository>()));

  getIt
      .registerLazySingleton<AddCommitUesCase>(() => AddCommitUesCase(getIt()));
  getIt.registerLazySingleton<AddRateUesCase>(() => AddRateUesCase(getIt()));
  getIt.registerLazySingleton<GetSearchResults>(
      () => GetSearchResults(getIt<ISearchRepository>()));

  getIt.registerLazySingleton<ForgetPasswordUseCase>(
      () => ForgetPasswordUseCase(getIt()));
  getIt.registerLazySingleton<VerifyCodeUseCase>(
      () => VerifyCodeUseCase(getIt()));
  getIt.registerLazySingleton<ResetPasswordUseCase>(
      () => ResetPasswordUseCase(getIt()));

  getIt.registerLazySingleton<GetProfileDataUC>(
    () => GetProfileDataUC(getIt()),
  );
  getIt.registerLazySingleton<DeleteAccountUC>(
    () => DeleteAccountUC(getIt()),
  );
  getIt.registerLazySingleton<UpdateProfileUc>(
    () => UpdateProfileUc(getIt()),
  );
  getIt.registerLazySingleton<UpdateProfilePhoto>(
      () => UpdateProfilePhoto(getIt()));

  getIt.registerLazySingleton<LogoutUseCase>(() => LogoutUseCase(getIt()));

  // Cubits //
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  getIt.registerFactory<DeleteAccountCubit>(() => DeleteAccountCubit(getIt()));
  getIt.registerFactory<LogoutCubit>(() => LogoutCubit(getIt()));
  getIt.registerFactory<RegisterCubit>(() => RegisterCubit(getIt()));
  getIt.registerLazySingleton<HomeCubit>(() => HomeCubit(
      getIt<GetNewPlacesUC>(),
      getIt<GetTopRatedPlacesUC>(),
      getIt<GetNearstPlacesUC>(),
      getIt<GetAllPlacesUC>(),
      getIt<UpdateLocationUC>()));

  getIt.registerFactory<PlaceDetailsCubit>(
      () => PlaceDetailsCubit(getIt<GetPlaceDetailsUc>()));

  getIt.registerFactory<GetFavoriteCubit>(() => GetFavoriteCubit(getIt()));
  getIt.registerFactory<AddFavoritePlaceCubit>(
      () => AddFavoritePlaceCubit(getIt<AddFavoritePlaceUc>()));

  getIt.registerFactory<SearchCubit>(() => SearchCubit(getIt()));
  getIt.registerFactory<ForgetPasswordCubit>(
      () => ForgetPasswordCubit(getIt(), getIt(), getIt()));

  getIt.registerFactory<ProfileCubit>(() => ProfileCubit(
        getIt(),
        getIt(),
        getIt(),
      ));
  getIt.registerFactory<AddCommitCubit>(() => AddCommitCubit(getIt(), getIt()));
}
