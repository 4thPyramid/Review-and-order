//place details view
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:review_app/core/theme/app_colors.dart';
import 'package:review_app/core/utils/app_assets.dart';
import 'package:review_app/core/utils/app_image_view.dart';

import 'components/place_details_components.dart';

class PlaceDetailsView extends StatelessWidget {
  const PlaceDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          
         decoration:  const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.onboarding1),
            fit: BoxFit.cover,
          ),
         ),
         child: Padding(
           padding:  EdgeInsets.only(top: 480.h),
           child: const PlaceDetailsComponent(),
         ),
        ),
      ),
    );
  }
}
