import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:review_app/core/utils/app_styles.dart';

import '../../../../../../core/common/widgets/custom_btn.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/utils/app_assets.dart';
import '../../../../../../core/utils/app_image_view.dart';
import '../../../../../../core/utils/app_strings.dart';
import 'add_commit_pop.dart';
import 'add_image_container.dart';
import 'profile_list_title.dart';

class AddImageAndBtn extends StatelessWidget {
  const AddImageAndBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.r),
      margin: EdgeInsets.only(top: 20.h, bottom: 20.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          const ProfileListTile(
            imageUrl: AppAssets.profileImage,
            name: AppStrings.myName,
            email: "ahmed@gmail.com",
          ),
          SizedBox(height: 20.h),
          const AddImageContainer(),
          SizedBox(height: 20.h),
          CustomButton(
            text: AppStrings.addCommit,
            onPressed: () {
              addCommitPop(context,
                  name: AppStrings.myName, imageUrl: AppAssets.profileImage);
            },
          )
        ],
      ),
    );
  }
}
