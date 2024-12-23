import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:review_app/core/utils/app_assets.dart';
import 'package:review_app/src/features/onbording/presentation/widgets/get_buttons.dart';
import 'package:review_app/src/features/onbording/presentation/widgets/onbording_body.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _controller = PageController(initialPage: 0);
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned.fill(
          child: SvgPicture.asset(
            AppAssets.onboardingSvg,
            fit: BoxFit.cover,
          ),
        ),
        ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            OnboardingBody(
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              controller: _controller,
              currentIndex: currentIndex,
            ),
          ],
        ),
      ]),
    );
  }
}
