import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:review_app/core/common/functions/onboarding_visited.dart';
import 'package:review_app/core/routes/router_names.dart';
import 'package:review_app/src/features/intro/presentation/widgets/next_button.dart';
import 'package:review_app/src/features/intro/presentation/widgets/skip_button.dart';

class GetButtons extends StatelessWidget {
  GetButtons({super.key, required this.currentIndex, required this.controller});
  final PageController controller;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SkipButton(onTap: () {
          onBoardingVisited();
          context.pushReplacement(RouterNames.letsStart);
        }),
        const Spacer(),
        NextButton(
          currentIndex: currentIndex,
          controller: controller,
        ),
      ],
    );
  }
}
