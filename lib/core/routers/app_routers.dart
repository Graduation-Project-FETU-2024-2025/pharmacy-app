import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/routers/routing.dart';
import 'package:pharmacy_app/features/all_branches/presentation/view/branches_screen.dart';
import 'package:pharmacy_app/features/auth/presentation/view_model/cubit/sign_in_cubit.dart';
import 'package:pharmacy_app/features/auth/presentation/views/otp_view.dart';
import 'package:pharmacy_app/features/auth/presentation/views/sign_in_view.dart';
import 'package:pharmacy_app/features/onboarding/presentation/view/onboarding_view.dart';
import 'package:pharmacy_app/features/splash/presentation/view/splash_view.dart';

class AppRouters {
  Route generateRoute(RouteSettings settings) {
    var argument = settings.arguments;
    switch (settings.name) {
      case Routing.splash:
        return _buildRoute(SplashView());

      case Routing.onboarding:
        return _buildRoute(OnboardingView());
      case Routing.signIn:
        return _buildRoute(
          BlocProvider(
            create: (context) => SignInCubit(),
            child: SignInView(),
          ),
        );
      case Routing.otp:
        return _buildRoute(OTPView());
      case Routing.branchesScreen:
        return MaterialPageRoute(
          builder: (_) => const BranchesScreen(),
        );

      default:
        return _buildRoute(
          Scaffold(
            body: Center(child: Text('Page not found: ${settings.name}')),
          ),
        );
    }
  }

  Route<dynamic> _buildRoute(Widget page) {
    return Platform.isIOS
        ? CupertinoPageRoute(
            builder: (_) => page,
          )
        : MaterialPageRoute(builder: (_) => page);
  }
}
