import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:review_app/src/features/intro/presentation/widgets/on_boarding_bottom_section.dart';

class OnboardingItem extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final PageController controller;
  final int currentIndex;

  const OnboardingItem({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.controller,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 650.0.h,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        OnBoardinBottomSection(
          title: title,
          subtitle: subtitle,
          currentIndex: currentIndex,
          controller: controller,
        )
      ],
    );
  }
}
