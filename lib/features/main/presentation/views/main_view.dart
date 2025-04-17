import 'package:flutter/material.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharmacy_app/core/services/get_it.dart';
import 'package:pharmacy_app/core/utils/app_colors.dart';
import 'package:pharmacy_app/core/utils/app_icons.dart';
import 'package:pharmacy_app/features/all_branches/data/repo/get_branches_repo.dart';
import 'package:pharmacy_app/features/all_branches/presentation/view/branches_screen.dart';
import 'package:pharmacy_app/features/all_branches/presentation/view_model/cubit/get_branches/get_branches_cubit.dart';
import 'package:pharmacy_app/features/all_medicines/data/repos/get_branch_products_repo.dart';
import 'package:pharmacy_app/features/all_medicines/presentation/view_models/cubit/get_branch_products_cubit.dart';
import 'package:pharmacy_app/features/all_medicines/presentation/views/all_medicine_view.dart';
import 'package:pharmacy_app/features/home/presentation/views/home_view.dart';
import 'package:pharmacy_app/features/profile/presentation/view/profile_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  NotchBottomBarController notchBottomBarController =
      NotchBottomBarController();
  // final List<GlobalKey<NavigatorState>> _navigatorKeys = List.generate(
  //   4,
  //   (_) => GlobalKey<NavigatorState>(),
  // );
  int currentIndex = 0;
  double kIconSize = 24.0;
  double kBottomRadius = 20.0;
  // Widget _buildOffstageNavigator(int index, String initialRoute) {
  //   return Offstage(
  //     offstage: currentIndex != index,
  //     child: Navigator(
  //       key: _navigatorKeys[index],
  //       onGenerateRoute: (settings) {
  //         return AppRouters().generateRoute(RouteSettings(name: initialRoute));
  //       },
  //     ),
  //   );
  // }
  List<Widget> screens = [
    const HomeView(),
    BlocProvider(
      create: (context) =>
          GetBranchesCubit(getIt<GetBranchesRepo>())..fetchBranches(),
      child: const BranchesScreen(),
    ),
    BlocProvider(
      create: (context) =>
          GetBranchProductsCubit(getIt<GetBranchProductsRepo>())
            ..selectBranch(),
      child: const AllMedicineView(),
    ),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: AnimatedNotchBottomBar(
        notchBottomBarController: notchBottomBarController,
        bottomBarItems: [
          BottomBarItem(
            inActiveItem: SvgPicture.asset(AppIcons.iconsMyHome),
            activeItem: SvgPicture.asset(
              AppIcons.iconsMyHome,
              colorFilter:
                  ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
            ),
          ),
          BottomBarItem(
            inActiveItem: SvgPicture.asset(AppIcons.iconsMyBranches),
            activeItem: SvgPicture.asset(
              AppIcons.iconsMyBranches,
              colorFilter:
                  ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
            ),
          ),
          BottomBarItem(
            inActiveItem: SvgPicture.asset(AppIcons.iconsMedicine),
            activeItem: SvgPicture.asset(
              AppIcons.iconsMedicine,
              colorFilter:
                  ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
            ),
          ),
          BottomBarItem(
            inActiveItem: SvgPicture.asset(AppIcons.iconsMyProfile),
            activeItem: SvgPicture.asset(
              AppIcons.iconsMyProfile,
              colorFilter:
                  ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
            ),
          ),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        kIconSize: kIconSize,
        kBottomRadius: kBottomRadius,
        color: AppColors.primaryColor,
      ),
    );
  }
}
