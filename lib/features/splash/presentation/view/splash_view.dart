import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharmacy_app/core/database/cache/cache_keys.dart';
import 'package:pharmacy_app/core/database/cache/cashe_helper.dart';
import 'package:pharmacy_app/core/helpers/extentions.dart';
import 'package:pharmacy_app/core/routers/routing.dart';
import 'package:pharmacy_app/core/services/get_it.dart';
import 'package:pharmacy_app/core/utils/app_colors.dart';
import 'package:pharmacy_app/core/utils/app_icons.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 5),
      () => _getInitRoute(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.white,
              AppColors.gradient1,
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Center(
          child: SvgPicture.asset(
            AppIcons.iconsSplash,
          ),
        ),
      ),
    );
  }

  _getInitRoute() {
    if (!getIt<CacheHelper>().getData(key: CacheKeys.isFirstTime)) {
      context
          .pushReplacementNamed(Routing.signIn); 
    } else {
      context.pushReplacementNamed(Routing.onboarding);
    }
  }
}
