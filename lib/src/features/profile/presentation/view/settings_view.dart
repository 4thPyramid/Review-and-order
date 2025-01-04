import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/routes/router_names.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../components/settings_component.dart';

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
