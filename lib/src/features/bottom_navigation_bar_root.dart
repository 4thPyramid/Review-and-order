import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:review_app/core/services/service_locator.dart';
import 'package:review_app/src/features/notification/notification_view.dart';
import 'package:review_app/src/features/profile/presentation/logic/profile_cubit.dart';
import 'package:review_app/src/features/search/presentation/logic/cubit/search_cubit.dart';

import '../../core/app_cubit/app_cubit.dart';
import '../../core/theme/app_colors.dart';
import 'home/presentation/view/home_view.dart';
import 'profile/presentation/view/profile_view.dart';
import 'search/presentation/view/search_view.dart';

class BottomNavigationBarRoot extends StatelessWidget {
  const BottomNavigationBarRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        final List<Widget> pages = [
          const HomeView(),
          BlocProvider(
            create: (context) => getIt<SearchCubit>(),
            child: const SearchView(),
          ),
          const NotificationView(),
          BlocProvider(
            create: (context) => getIt<ProfileCubit>(),
            child: const ProfileView(),
          ),
        ];
        return Scaffold(
          backgroundColor: AppColors.greyForBackground,
          body: SafeArea(
            bottom: false,
            child: pages[state.bottomNavBarSelectedIndex],
          ),
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: AppColors.lightGrey, width: 1.5),
              ),
            ),
            child: BottomNavigationBar(
              showSelectedLabels: false,
              type: BottomNavigationBarType.shifting,
              selectedItemColor: AppColors.primaryColor,
              unselectedItemColor: AppColors.textColor,
              showUnselectedLabels: false,
              backgroundColor: AppColors.openGrey,
              elevation: 2,
              currentIndex: state.bottomNavBarSelectedIndex,
              onTap: (index) => context
                  .read<AppCubit>()
                  .changeBottomNavBarSelectedIndex(index),
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.search_outlined,
                  ),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.notifications_outlined),
                  label: 'Notification',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
