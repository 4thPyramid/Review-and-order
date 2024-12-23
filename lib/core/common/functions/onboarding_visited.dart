import 'package:review_app/core/data/cached/cache_helper.dart';

void onBoardingVisited() {
  CacheHelper.saveData(key: 'onBoarding', value: true);
}
