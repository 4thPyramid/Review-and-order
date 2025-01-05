import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/services/service_locator.dart';
import '../components/favorite_components.dart';
import '../logic/get_favorite_cubit.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: BlocProvider(
       create: (context) => getIt<GetFavoriteCubit>()..getFavoriteList(),
          child: Padding(
            padding:  EdgeInsets.only(top: 40.0.h , left: 24.0.w, right: 24.0.w),
            child: const FavoriteComponents(),
          ),
        ),
      ),
    );
  }
}
