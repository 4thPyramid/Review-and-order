import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:review_app/core/app_cubit/app_cubit.dart';
import 'package:review_app/core/routes/app_routers.dart';
import 'package:review_app/core/services/service_locator.dart';
import 'package:review_app/core/theme/app_themes.dart';
import 'package:review_app/src/features/home/presentation/logic/cubit/home_cubit.dart';
import 'package:review_app/src/features/profile/presentation/logic/profile_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt<AppCubit>(),
          ),
          BlocProvider(
            create: (context) => getIt<HomeCubit>(),
          ),
          BlocProvider(
            create: (context) => getIt<ProfileCubit>(),
          ),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          routerConfig: router,
          locale: const Locale('ar', ''),
          supportedLocales: const [
            Locale('ar', ''),
            Locale('en', ''),
          ],
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          localeResolutionCallback: (deviceLocale, supportedLocales) {
            return deviceLocale?.languageCode == 'ar'
                ? const Locale('ar', '')
                : const Locale('en', '');
          },
          builder: (context, child) {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: child!,
            );
          },
        ),
      ),
    );
  }
}
