import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:review_app/core/routes/router_names.dart';
import 'package:review_app/core/theme/app_colors.dart';
import 'package:review_app/core/utils/app_assets.dart';

import '../components/place_details_components.dart';
import '../logic/place_details/place_details_cubit.dart';

class PlaceDetailsView extends StatelessWidget {
  const PlaceDetailsView({
    super.key,
    required this.placeId,
  });

  final int placeId;

  refresh(BuildContext context) async {
    await context.read<PlaceDetailsCubit>().getPlaceDetails(placeId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => refresh(context),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Stack(
            children: [
              BlocBuilder<PlaceDetailsCubit, PlaceDetailsState>(
                builder: (context, state) {
                  return state.when(
                    initial: () {
                      context
                          .read<PlaceDetailsCubit>()
                          .getPlaceDetails(placeId);
                      return _buildLoading();
                    },
                    loading: () => _buildLoading(),
                    loaded: (place) => Column(
                      children: [
                        SizedBox(
                          height: 400.h,
                          child: CachedNetworkImage(
                            imageUrl: place.coverImage ?? '',
                          ),
                        ),
                        const PlaceDetailsComponent(),
                      ],
                    ),
                    error: (error) => Center(child: Text(error.toString())),
                  );
                },
              ),
              Positioned(
                top: 60.h,
                right: 20.w,
                child: IconButton(
                  onPressed: () {
                    context.go(RouterNames.bottomNavigationBarRoot);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoading() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.onboarding1),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 480.h),
        child: const PlaceDetailsComponent(),
      ),
    );
  }
}
