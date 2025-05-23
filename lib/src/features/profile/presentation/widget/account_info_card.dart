import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:review_app/core/routes/router_names.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_image_view.dart';
import '../../../../../core/utils/app_styles.dart';

class AccountInfoCard extends StatelessWidget {
  const AccountInfoCard({
    super.key,
    required this.name,
    required this.phone,
    this.image,
  });
  final String name;
  final String phone;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.network(
            image ??
                "https://www.advanced-healthclinic.com/wp-content/uploads/2020/12/blank-profile-picture-973460_1280-680x680.png",
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        ),

        //  AppImageView(
        //   image??AppAssets.profileImage,
        //   isAvatar: true,
        // ),
        title: Text(
          name,
          style: AppStyles.s20.copyWith(
            color: AppColors.textColor,
            fontWeight: FontWeight.w700,
          ),
        ),
        subtitle: Text(
          phone,
          style: AppStyles.s14.copyWith(
            color: AppColors.greyForText,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: InkWell(
          onTap: () {
            context.push(RouterNames.personalInfoView);
          },
          child: const AppImageView(
            AppAssets.editIcon,
            width: 20,
            height: 20,
          ),
        ));
  }
}
