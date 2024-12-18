import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/core/utils/app_colors.dart';
import 'package:pharmacy_app/features/all_medicine/presentation/views/widgets/all_medicine_view_body.dart';

class AllMedicineView extends StatelessWidget {
  const AllMedicineView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AllMedicineViewBody(),
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 30.h,
          horizontal: 8.w,
        ),
        child: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: AppColors.primaryColor,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
