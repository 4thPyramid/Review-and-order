//place details view
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:review_app/core/routes/router_names.dart';
import 'package:review_app/core/theme/app_colors.dart';
import 'package:review_app/core/utils/app_assets.dart';

import '../components/place_details_components.dart';
import '../logic/place_details/place_details_cubit.dart';

class PlaceDetailsView extends StatefulWidget {
  const PlaceDetailsView({super.key, required this.placeId, });
  final int placeId;

  @override
  State<PlaceDetailsView> createState() => _PlaceDetailsViewState();
}

class _PlaceDetailsViewState extends State<PlaceDetailsView> {
  @override
  void initState() {
    super.initState();
     context.read<PlaceDetailsCubit>().getPlaceDetails(widget.placeId);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    AppAssets.onboarding1,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 480.h),
                child: const PlaceDetailsComponent(),
              ),
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
                  color: AppColors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
