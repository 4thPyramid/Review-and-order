import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:review_app/core/routes/router_names.dart';
import 'package:review_app/core/common/functions/password_visibility_cubit.dart';
import 'package:review_app/src/features/auth/presentaion/views/forget_password.dart';
import 'package:review_app/src/features/auth/presentaion/views/login_view.dart';
import 'package:review_app/src/features/auth/presentaion/views/register_view.dart';
import 'package:review_app/src/features/intro/presentation/view/lets_start_view.dart';
import 'package:review_app/src/features/intro/presentation/view/onboarding_view.dart';
import 'package:review_app/src/splash_view.dart';

import '../../src/features/bottom_navigation_bar_root.dart';

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
      builder: (context, state) => BlocProvider(
        create: (context) => PasswordVisibilityCubit(),
        child: LoginView(),
      ),
    ),
    GoRoute(
      path: RouterNames.letsStart,
      builder: (context, state) => const LetsStartView(),
    ),
    GoRoute(
      path: RouterNames.register,
      builder: (context, state) => const RegisterView(),
    ),
    GoRoute(
      path: RouterNames.forgetPassword,
      builder: (context, state) => const ForgetPassword(),
    ),
    GoRoute(path: RouterNames.bottomNavigationBarRoot,
     builder: (context, state) => const BottomNavigationBarRoot()),
  ],
);
