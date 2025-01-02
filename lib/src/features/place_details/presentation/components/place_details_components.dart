import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:review_app/core/utils/app_assets.dart';
import 'package:review_app/src/features/place_details/presentation/logic/cubit/place_details_cubit.dart';
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
    required this.placeId,
  });
  final int placeId;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<PlaceDetailsCubit>(context).getPlaceDetails(placeId);
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  TitleAndFavoriteButton(
                    placeName: place.name,
                  ),
                  RateAndTimeRow(
                    openAt: place.openAt,
                    closeAt: place.closeAt,
                    rate: place.rating,
                    reviewsCount: place.reviewsCount,
                  ),
                  MapCardDetails(
                    restaurantAddress: place.mapDisc,
                    arrivalTime: '3',
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
                    itemCount: place.reviews.length,
                    itemBuilder: (context, index) {
                      return CommentsList(
                        userProfilImagePath: place.reviews[index].user.image ??
                            AppAssets.profileImage,
                        userName: place.reviews[index].user.name,
                        userEmail: place.reviews[index].user.email,
                        commentImagePath: place.reviews[index].image,
                        commentText: place.reviews[index].content,
                        rate: place.reviews[index].userRating,
                        itemCount: place.reviews.length,
                      );
                    },
                  )
                ])
              ],
            ),
          ),
          error: (error) => Center(child: Text(error.message)),
        );
      },
    );
  }
}
