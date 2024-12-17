import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/routers/routing.dart';
import 'package:pharmacy_app/features/all_branches/presentation/view/branches_screen.dart';
import 'package:pharmacy_app/features/auth/presentation/view_model/otp_cubit/otp_cubit.dart';
import 'package:pharmacy_app/features/auth/presentation/view_model/sign_in_cubit/sign_in_cubit.dart';
import 'package:pharmacy_app/features/auth/presentation/views/otp_view.dart';
import 'package:pharmacy_app/features/auth/presentation/views/sign_in_view.dart';
import 'package:pharmacy_app/features/onboarding/presentation/view/onboarding_view.dart';
import 'package:pharmacy_app/features/pharmacy_details/presentation/view/pharmacy_details_view.dart';
import 'package:pharmacy_app/features/pharmacy_edit/presentation/view/pharmacy_edit_screen.dart';
import 'package:pharmacy_app/features/pharmacy_edit/presentation/view_model/pharmacy_Edit_cubit/pharmacy_edit_cubit.dart';
import 'package:pharmacy_app/features/profile/presentation/view/profile_view.dart';
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
        return _buildRoute(BlocProvider(
          create: (context) => OtpCubit(),
          child: OTPView(
            email: argument as String,
          ),
        ));
      case Routing.branchesScreen:
        return _buildRoute(BranchesScreen());
      case Routing.pharmacyDetail:
        return _buildRoute(PharmacyDetailsView());
      case Routing.pharmacyEdit:
        return _buildRoute(BlocProvider(
          create: (context) => PharmacyEditCubit(),
          child: PharmacyEditScreen(),
        ));
       case Routing.profile:
        return _buildRoute(ProfileView());
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
