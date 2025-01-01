import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';

class AddImageContainer extends StatelessWidget {
  const AddImageContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      decoration: BoxDecoration(
        color: AppColors.redWhite,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.add_a_photo_outlined,
              size: 50.r,
              color: AppColors.black,
            )),
      ),
    );
  }
}
