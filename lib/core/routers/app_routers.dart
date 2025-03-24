import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/routers/routing.dart';
import 'package:pharmacy_app/core/services/get_it.dart';
import 'package:pharmacy_app/features/add_medicine/data/models/system_medicine_model.dart';
import 'package:pharmacy_app/features/add_medicine/presentation/view_models/cubit/system_medicines_cubit.dart';
import 'package:pharmacy_app/features/add_medicine/presentation/views/system_medicine_view.dart';
import 'package:pharmacy_app/features/all_branches/data/repo/get_branches_repo.dart';
import 'package:pharmacy_app/features/all_branches/presentation/view/branches_screen.dart';
import 'package:pharmacy_app/features/all_branches/presentation/view_model/cubit/get_branches/get_branches_cubit.dart';
import 'package:pharmacy_app/features/all_medicines/data/repos/get_branch_products_repo.dart';
import 'package:pharmacy_app/features/all_medicines/presentation/view_models/cubit/get_branch_products_cubit.dart';
import 'package:pharmacy_app/features/auth/data/repository/auth_repo.dart';
import 'package:pharmacy_app/features/auth/presentation/view_model/otp_cubit/otp_cubit.dart';
import 'package:pharmacy_app/features/auth/presentation/view_model/sign_in_cubit/sign_in_cubit.dart';
import 'package:pharmacy_app/features/auth/presentation/views/otp_view.dart';
import 'package:pharmacy_app/features/auth/presentation/views/sign_in_view.dart';
import 'package:pharmacy_app/features/home/presentation/views/home_view.dart';
import 'package:pharmacy_app/features/medicine_details/presentation/views/medicine_details_view.dart';
import 'package:pharmacy_app/features/onboarding/presentation/view/onboarding_view.dart';
import 'package:pharmacy_app/features/pharmacy_details/presentation/view/pharmacy_details_view.dart';
import 'package:pharmacy_app/features/pharmacy_edit/presentation/view/pharmacy_edit_screen.dart';
import 'package:pharmacy_app/features/pharmacy_edit/presentation/view_model/pharmacy_Edit_cubit/pharmacy_edit_cubit.dart';
import 'package:pharmacy_app/features/profile/presentation/view/profile_view.dart';
import 'package:pharmacy_app/features/splash/presentation/view/splash_view.dart';
import '../../features/add_medicine/data/repos/get_system_medicines_repo.dart';
import '../../features/add_medicine/presentation/view_models/cubit/add_medicine_cubit.dart';
import '../../features/add_medicine/presentation/views/add_medicine_view.dart';
import '../../features/all_branches/data/models/pharmacy_branch_model.dart';
import '../../features/all_medicines/data/models/medicine_branch_model.dart';
import '../../features/all_medicines/presentation/views/all_medicine_view.dart';
import '../../features/pharmacy_edit/data/repo/add_branch_repo.dart';

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
            create: (context) => SignInCubit(getIt<AuthRepo>()),
            child: SignInView(),
          ),
        );
      case Routing.otp:
        return _buildRoute(BlocProvider(
          create: (context) => OtpCubit(getIt<AuthRepo>()),
          child: OTPView(
            email: argument as String,
          ),
        ));
      case Routing.addMedicine:
        final args = argument as Map<String, dynamic>;
        final systemMedicine = args['systemMedicine'] as SystemMedicineModel;
        final branchId = args['branchId'] as String;
        return _buildRoute(BlocProvider(
          create: (context) => AddMedicineCubit(),
          child: AddMedicineView(
            systemMedicineModel: systemMedicine,
            branchId: branchId,
          ),
        ));
      case Routing.branchesScreen:
        return _buildRoute(BlocProvider(
          create: (context) =>
              GetBranchesCubit(getIt<GetBranchesRepo>())..fetchBranches(),
          child: BranchesScreen(),
        ));
      case Routing.homeView:
        return _buildRoute(HomeView());
      case Routing.allMedicinesScreen:
        return _buildRoute(BlocProvider(
          create: (context) =>
              GetBranchProductsCubit(getIt<GetBranchProductsRepo>()),
          child: AllMedicineView(),
        ));
      case Routing.medicineDetails:
        final medicine = argument as MedicineBranchModel;
        return _buildRoute(
          MedicineDetailsView(
            medicineBranchModel: medicine,
          ),
        );
      case Routing.pharmacyDetail:
        return _buildRoute(
          PharmacyDetailsView(
            branchId: settings.arguments as String
            ),
        );
      case Routing.pharmacyEdit:
        return _buildRoute(BlocProvider(
          create: (context) => PharmacyEditCubit(getIt<AddBranchRepo>()),
          child: PharmacyEditScreen(
            branch: settings.arguments as PharmacyBranchModel?,
          ),
        ));
      case Routing.profile:
        return _buildRoute(ProfileView());
      case Routing.systemMedicine:
        final branchId = settings.arguments as String;
        return _buildRoute(BlocProvider(
          create: (context) =>
              SystemMedicinesCubit(getIt<GetSystemMedicinesRepo>())
                ..getSystemMedicines(),
          child: SystemMedicineView(
            branchId: branchId,
          ),
        ));
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
