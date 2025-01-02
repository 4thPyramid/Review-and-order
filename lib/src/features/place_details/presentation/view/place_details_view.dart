//place details view
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:review_app/core/common/widgets/custom_btn.dart';
import 'package:review_app/core/routes/app_routers.dart';
import 'package:review_app/core/routes/router_names.dart';
import 'package:review_app/core/theme/app_colors.dart';
import 'package:review_app/core/utils/app_assets.dart';
import 'package:review_app/core/utils/app_image_view.dart';

import '../components/place_details_components.dart';

class PlaceDetailsView extends StatelessWidget {
  const PlaceDetailsView({super.key, required this.placeId});
  final int placeId;

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
                child: PlaceDetailsComponent(
                  placeId: placeId,
                ),
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
