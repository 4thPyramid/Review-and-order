import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:review_app/src/features/onbording/data/onbording_model.dart';
import 'package:review_app/src/features/onbording/presentation/widgets/onboarding_item.dart';

class OnboardingBody extends StatelessWidget {
  const OnboardingBody({
    super.key,
    required this.onPageChanged,
    required this.controller,
    required this.currentIndex,
  });

  final PageController controller;
  final Function(int) onPageChanged;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 900.h,
      child: PageView.builder(
        controller: controller,
        onPageChanged: onPageChanged,
        physics: const BouncingScrollPhysics(),
        itemCount: onBoardingList.length,
        itemBuilder: (context, index) {
          final item = onBoardingList[index];
          return OnboardingItem(
            image: item.image,
            title: item.title,
            subtitle: item.suptitle,
            controller: controller,
            currentIndex: currentIndex,
          );
        },
      ),
    );
  }
}
