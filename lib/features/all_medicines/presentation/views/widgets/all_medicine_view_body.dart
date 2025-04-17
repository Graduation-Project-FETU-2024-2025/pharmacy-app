import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharmacy_app/core/utils/app_colors.dart';
import 'package:pharmacy_app/core/utils/app_icons.dart';
import 'package:pharmacy_app/features/all_medicines/presentation/view_models/cubit/get_branch_products_cubit.dart';
import 'package:pharmacy_app/features/all_medicines/presentation/views/widgets/filter_dialog.dart';
import '../../../../../core/widgets/search_text_field.dart';
import 'all_medicines_grid_view.dart';

class AllMedicineViewBody extends StatefulWidget {
  const AllMedicineViewBody({super.key});

  @override
  _AllMedicineViewBodyState createState() => _AllMedicineViewBodyState();
}

class _AllMedicineViewBodyState extends State<AllMedicineViewBody> {
  int? selectedIndex = 0;

  void updateSelection(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final getBranchProductsCubit = GetBranchProductsCubit.get(context);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 24.0.h),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => FilterDialog(
                        selectedIndex: selectedIndex,
                        onSelect: updateSelection,
                      ),
                    );
                  },
                  child: SvgPicture.asset(
                    AppIcons.iconsFilter,
                    width: 24.w,
                    height: 24.h,
                    colorFilter: const ColorFilter.mode(
                      AppColors.primaryColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            SearchTextField(
              onChanged: (value) {
                getBranchProductsCubit.searchInBranchProducts();
              },
              onPressed: () {
                getBranchProductsCubit.searchInBranchProducts();
              },
              controller: getBranchProductsCubit.searchController,
            ),
            SizedBox(height: 60.h),
            AllMedicinesGridview(),
          ],
        ),
      ),
    );
  }
}
