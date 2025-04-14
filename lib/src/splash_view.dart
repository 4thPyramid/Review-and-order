import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:review_app/core/data/cached/cache_helper.dart';
import 'package:review_app/core/routes/router_names.dart';
import 'package:review_app/core/theme/app_colors.dart';
import 'package:review_app/core/utils/app_assets.dart';
import 'package:review_app/core/utils/app_strings.dart';
import 'package:review_app/core/utils/app_styles.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startSplashTimer();
  }

  void _startSplashTimer() {
    _timer = Timer(
      const Duration(seconds: 3),
      () => _navigationFromSplash(),
    );
  }

  void _navigationFromSplash() {
    bool onBoardingVisited = CacheHelper.getData(key: 'onBoarding') ?? false;

    if (CacheHelper.getToken() != null) {
      context.go(RouterNames.bottomNavigationBarRoot);
    } else if (onBoardingVisited) {
      // context.go(RouterNames.onboarding);

      context.go(RouterNames.login);
    } else {
      context.go(RouterNames.onboarding);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppAssets.logo),
            const SizedBox(height: 16),
            Text(
              AppStrings.appName,
              style: AppStyles.s24,
            ),
          ],
        ),
      ),
    );
  }
}
