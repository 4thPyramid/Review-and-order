import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:review_app/core/utils/app_strings.dart';
import 'package:review_app/core/utils/app_styles.dart';
import 'package:review_app/src/features/place_details/presentation/view/place_details_view.dart';

import '../logic/get_favorite_cubit.dart';
import '../logic/get_favorite_state.dart';
import '../widget/favorite_card_item.dart';
import '../widget/places_you_like_it.dart';

class FavoriteComponents extends StatelessWidget {
  const FavoriteComponents({super.key});

  @override
  Widget build(BuildContext context) {
    // context.read<GetFavoriteCubit>().getFavoriteList();
    return BlocBuilder<GetFavoriteCubit, GetFavoriteState>(
      builder: (context, state) {
        return state.map(
          initial: (_) => const Center(child: Text('Initialize favorites...')),
          loading: (_) => const Center(child: CircularProgressIndicator()),
          error: (errorState) => Center(
            child: Text(
              'Error: ${errorState.message.message}',
              style: const TextStyle(color: Colors.red),
            ),
          ),
          loaded: (loadedState) {
            final favoriteResponse = loadedState.favorite;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16.0.h),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        context.pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.black,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.favorite,
                          style: AppStyles.s24,
                        ),
                        PlacesYouLikeIt(length: favoriteResponse.total),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: 20.0.h, left: 24.0.w, right: 24.0.w),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: favoriteResponse.total,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        child: FavoriteCardItem(
                          favorite: favoriteResponse.data[index],
                        ),
                      );
                    },
                  ),
                )
              ],
            );
          },
        );
      },
    );
  }
}
