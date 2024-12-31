import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:review_app/core/routes/router_names.dart';
import 'package:review_app/core/common/functions/password_visibility_cubit.dart';
<<<<<<< HEAD
import 'package:review_app/src/features/auth/presentation/views/forget_password.dart';
import 'package:review_app/src/features/auth/presentation/views/login_view.dart';
import 'package:review_app/src/features/auth/presentation/views/register_view.dart';
=======
import 'package:review_app/src/features/auth/presentaion/logic/register/register_cubit.dart';
import 'package:review_app/src/features/auth/presentaion/views/forget_password.dart';
import 'package:review_app/src/features/auth/presentaion/views/login_view.dart';
import 'package:review_app/src/features/auth/presentaion/views/register_view.dart';
>>>>>>> f696ac15dde1e0224fe0457ff9ff143d9cf7690d
import 'package:review_app/src/features/intro/presentation/view/lets_start_view.dart';
import 'package:review_app/src/features/intro/presentation/view/onboarding_view.dart';
import 'package:review_app/src/features/place_details/presentation/view/place_details_view.dart';
import 'package:review_app/src/splash_view.dart';

import '../../src/features/auth/presentaion/logic/login/login_cubit.dart';
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
      builder: (context, state) => const ForgetPassword(),
    ),
    GoRoute(path: RouterNames.bottomNavigationBarRoot,
     builder: (context, state) => const BottomNavigationBarRoot()),

      GoRoute(
      path: RouterNames.placeDetailsView,
      builder: (context, state) => const PlaceDetailsView(),
    ),
    GoRoute(
        path: RouterNames.bottomNavigationBarRoot,
        builder: (context, state) => const BottomNavigationBarRoot()),
  ],
);
