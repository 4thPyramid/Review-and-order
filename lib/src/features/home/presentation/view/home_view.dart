import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:review_app/core/common/widgets/custom_text_form_field.dart';
import 'package:review_app/src/features/home/presentation/widget/custom_row_filter.dart';

import '../../../../../core/utils/app_strings.dart';
import '../components/best_restaurant_cafes_row.dart';
import '../components/extra_suggestions_list.dart';
import '../widget/custom_title.dart';
import '../widget/home_app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(28.0.r),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const HomeAppBar(),
          SizedBox(height: 20.h),
          const CustomTextFormField(
              hintText: AppStrings.searchFor, prefixIcon: Icon(Icons.search)),
          SizedBox(height: 20.h),
          const CustomRowFilter(),
          SizedBox(height: 20.h),
          const CustomTitle(title: AppStrings.bestRestaurantsCafes),
          SizedBox(height: 20.h),
          const BestRestaurantsCafesRow(),
          SizedBox(height: 20.h),
          const CustomTitle(title: AppStrings.extraSuggestion),
          SizedBox(height: 20.h),
          const ExtraSuggestions(),
        ]),
      ),
    );
  }
}
