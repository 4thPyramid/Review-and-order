import 'package:review_app/core/utils/app_assets.dart';

class OnBoardingModel {
  final String image;
  final String title;
  final String suptitle;

  OnBoardingModel({
    required this.image,
    required this.title,
    required this.suptitle,
  });
}

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
    image: AppAssets.onboarding1,
    title: 'ابحث عن افضل مكان',
    suptitle: 'حدد مكانك المناسب',
  ),
  OnBoardingModel(
    image: AppAssets.onboarding2,
    title: 'اكتشف الاماكن في مدينتك',
    suptitle: 'اكتشف الاماكن في مدينتك',
  ),
  OnBoardingModel(
    image: AppAssets.onboarding3,
    title: 'ابدأ رحلتك الي الاماكن المميزه',
    suptitle: 'ابدأ رحلتك الي الاماكن المميزه',
  )
];
