import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:review_app/core/routes/router_names.dart';
import 'package:review_app/core/common/functions/password_visibility_cubit.dart';
import 'package:review_app/src/features/auth/presentation/views/forget_password.dart';
import 'package:review_app/src/features/auth/presentation/views/login_view.dart';
import 'package:review_app/src/features/auth/presentation/views/register_view.dart';
import 'package:review_app/src/features/auth/presentation/logic/register/register_cubit.dart';
import 'package:review_app/src/features/auth/presentation/views/reset_password.dart';
import 'package:review_app/src/features/auth/presentation/views/verify_code_view.dart';
import 'package:review_app/src/features/favorite/presentation/logic/get_favorite_cubit.dart';
import 'package:review_app/src/features/favorite/presentation/view/favorite_view.dart';

import 'package:review_app/src/features/home/presentation/view/home_view.dart';
import 'package:review_app/src/features/intro/presentation/view/lets_start_view.dart';
import 'package:review_app/src/features/intro/presentation/view/onboarding_view.dart';
import 'package:review_app/src/features/place_details/presentation/logic/cubit/add_favorite_place_cubit.dart';
import 'package:review_app/src/features/place_details/presentation/logic/place_details/place_details_cubit.dart';
import 'package:review_app/src/features/place_details/presentation/view/place_details_view.dart';
import 'package:review_app/src/features/profile/presentation/view/personal_info_view.dart';
import 'package:review_app/src/features/profile/presentation/view/settings_view.dart';
import 'package:review_app/src/splash_view.dart';

import '../../src/features/auth/presentation/logic/forget_password/forget_password_cubit.dart';
import '../../src/features/auth/presentation/logic/login/login_cubit.dart';
import '../../src/features/bottom_navigation_bar_root.dart';
import '../services/service_locator.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: RouterNames.splash,
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: RouterNames.onboarding,
      builder: (context, state) => const OnboardingView(),
    ),
    GoRoute(
      path: RouterNames.login,
      builder: (context, state) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => PasswordVisibilityCubit(),
          ),
          BlocProvider(
            create: (context) => getIt<LoginCubit>(),
          ),
        ],
        child: LoginView(),
      ),
    ),
    GoRoute(
      path: RouterNames.letsStart,
      builder: (context, state) => const LetsStartView(),
    ),
    GoRoute(
      path: RouterNames.register,
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<RegisterCubit>(),
        child: const RegisterView(),
      ),
    ),
    GoRoute(
      path: RouterNames.forgetPassword,
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<ForgetPasswordCubit>(),
        child: const ForgetPassword(),
      ),
    ),
    GoRoute(
        path: RouterNames.placeDetailsView,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;
          final placeId = extra['placeId'] as int?;
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<PlaceDetailsCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<AddFavoritePlaceCubit>(),
              ),
            ],
            child: PlaceDetailsView(placeId: placeId ?? 0),
          );
        }),
    GoRoute(
      path: RouterNames.bottomNavigationBarRoot,
      builder: (context, state) => const BottomNavigationBarRoot(),
    ),
    GoRoute(
      path: RouterNames.home,
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
        path: RouterNames.verifyCodeView,
        builder: (context, state) {
          final email = state.extra as String;
          pragma('email --->: $email');
          return BlocProvider(
            create: (context) => getIt<ForgetPasswordCubit>(),
            child: VerifyCodeView(
              email: email,
            ),
          );
        }),
    GoRoute(
        path: RouterNames.personalInfoView,
        builder: (context, state) => const PersonalInfoView()),
    GoRoute(
        path: RouterNames.settingView,
        builder: (context, state) => const SettingsView()),
    GoRoute(
        path: RouterNames.favoriteView,
        builder: (context, state) => const FavoriteView()),
    GoRoute(
      path: RouterNames.resetPassword,
      builder: (context, state) {
        final data = state.extra as Map<String, dynamic>;
        final email = data['email']!;
        final code = data['code']!;
        print(email);
        print(code);
        return BlocProvider(
          create: (context) => getIt<ForgetPasswordCubit>(),
          child: ResetPassword(email: email, code: code),
        );
      },
    ),
  ],
);
