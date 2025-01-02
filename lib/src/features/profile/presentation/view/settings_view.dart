import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/routes/router_names.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../widget/custom_list_tile.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.black,
          ),
          onPressed: () {
            context.push(RouterNames.bottomNavigationBarRoot);
          },
        ),
        title: const Text(
          AppStrings.settings,
          style: TextStyle(color: AppColors.black),
        ),
      ),
      body: const SettingsComponent(),
    );
  }
}

class SettingsComponent extends StatelessWidget {
  const SettingsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
         CustomListTile(
          title: AppStrings.notification,
          icon: Icons.notifications_none,
          iconColor: AppColors.primaryColor,
        ),
          CustomListTile(
          title: AppStrings.notification,
          icon: Icons.notifications_none,
          iconColor: AppColors.primaryColor,
        ),
          //   const SettingsListTile(
          //     title: AppStrings.privacy,
          //     icon: Icons.privacy_tip_outlined,
          //   ),
          //   const SettingsListTile(
          //     title: AppStrings.terms,
          //     icon: Icons.article_outlined,
          //   ),
          //   const SettingsListTile(
          //     title: AppStrings.logout,
          //     icon: Icons.logout,
          //   ),
        ],
      ),
    );
  }
}
