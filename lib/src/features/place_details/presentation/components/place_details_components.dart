import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:review_app/core/common/widgets/custom_btn.dart';
import 'package:review_app/core/routes/router_names.dart';
import 'package:review_app/core/utils/app_assets.dart';
import 'package:review_app/src/features/place_details/presentation/logic/cubit/add_favorite_place_cubit.dart';
import 'package:review_app/src/features/place_details/presentation/logic/place_details/place_details_cubit.dart';
import 'package:review_app/src/features/place_details/presentation/widgets/add_commit_pop.dart';
import 'package:review_app/src/features/place_details/presentation/widgets/comments_list.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_styles.dart';
import '../widgets/map_card_details.dart';
import '../widgets/rate_and_time_row.dart';
import '../widgets/title_and_favorite.dart';

class PlaceDetailsComponent extends StatelessWidget {
  const PlaceDetailsComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlaceDetailsCubit, PlaceDetailsState>(
      builder: (context, state) {
        return state.when(
          initial: () => const Center(child: CircularProgressIndicator()),
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (place) => Container(
            padding: EdgeInsets.only(top: 60.h, left: 26.w, right: 26.w),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.r),
                topRight: Radius.circular(40.r),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TitleAndFavoriteButton(
                  placeName: place.name ?? '',
                  onTap: () {
                    BlocProvider.of<AddFavoritePlaceCubit>(context)
                        .addFavoritePlace(place.id ?? 0);
                  },
                ),
                RateAndTimeRow(
                  openAt: place.openAt ?? '',
                  closeAt: place.closeAt ?? '',
                  rate: place.rating ?? 0.0,
                  reviewsCount: place.reviewsCount ?? 0,
                ),
                MapCardDetails(
                  restaurantAddress: place.mapDisc ?? '',
                  arrivalTime: '3',
                  onTap: () {
                    context.go(RouterNames.maps, extra: {
                      'lat': place.latitude,
                      'lng': place.longitude,
                    });
                  },
                ),
                SizedBox(height: 20.h),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    AppStrings.ratings,
                    style: AppStyles.s20.copyWith(
                        color: AppColors.black, fontWeight: FontWeight.w700),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: place.reviews!.length,
                  itemBuilder: (context, index) {
                    print(place.reviews![index].user?.image);
                    return CommentsList(
                      userProfileImagePath: place.reviews![index].user?.image ??
                          AppAssets.profileImage,
                      userName: place.reviews![index].user?.name ?? "",
                      userEmail: place.reviews![index].user?.email ?? '',
                      commentImagePath:
                          place.reviews![index].image ?? place.coverImage ?? '',
                      commentText: place.reviews![index].content ?? '',
                      rate: place.reviews![index].userRating ?? 0.0,
                    );
                  },
                ),
                CustomButton(
                    text: AppStrings.addCommit,
                    onPressed: () {
                      print('place id: ${place.id}');
                      addCommitPop(context,
                          placeId: place.id ?? 0,
                          name: place.reviews![0].user?.name ?? '',
                          imageUrl: place.reviews![0].user?.image ??
                              AppAssets.profileImage);
                    }),
                SizedBox(height: 20.h),
              ],
            ),
          ),
          error: (error) => Center(child: Text(error.message)),
        );
      },
    );
  }
}
