import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:review_app/core/routes/router_names.dart';
import 'package:review_app/core/theme/app_colors.dart';

class NextButton extends StatelessWidget {
  const NextButton(
      {super.key, required this.currentIndex, required this.controller});
  final int currentIndex;
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: GestureDetector(
        onTap: () {
          if (controller.page == 2) {
            context.pushReplacement(RouterNames.login);
          } else {
            controller.nextPage(
              duration: const Duration(milliseconds: 200),
              curve: Curves.bounceIn,
            );
          }
        },
        child: Container(
            height: 60.h,
            width: 60.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primaryColor,
            ),
            child: const Padding(
              padding: EdgeInsets.only(right: 6),
              child: Icon(
                Icons.arrow_forward_ios,
                color: AppColors.white,
              ),
            )),
      ),
    );
  }
}
