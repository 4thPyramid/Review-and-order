import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:review_app/core/theme/app_colors.dart';

class ForgetPasswordTapBar extends StatelessWidget {
  const ForgetPasswordTapBar({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 340.w,
        height: 56.h,
        padding: EdgeInsets.symmetric(vertical: 6.h),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.grey, width: .5),
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: TabBar(
          dividerColor: AppColors.primaryColor,
          dividerHeight: 0,
          controller: _tabController,
          labelColor: AppColors.primaryColor,
          unselectedLabelColor: Colors.grey,
          indicator: BoxDecoration(
            shape: BoxShape.rectangle,
            border: const Border.symmetric(),
            color: AppColors.greyForSelectTap,
            borderRadius: BorderRadius.circular(8.r),
          ),
          tabs: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Tab(text: 'رقم الهاتف'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Tab(text: 'البريد الالكتروني'),
            ),
          ],
        ),
      ),
    );
  }
}
