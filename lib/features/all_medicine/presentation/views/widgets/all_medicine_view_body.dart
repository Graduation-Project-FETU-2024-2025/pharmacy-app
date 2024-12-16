import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharmacy_app/core/utils/app_colors.dart';
import 'package:pharmacy_app/core/utils/app_icons.dart';
import 'all_medicines_grid_view.dart';
import 'search_text_field.dart';

class AllMedicineViewBody extends StatelessWidget {
  const AllMedicineViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 24.0,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SvgPicture.asset(
                    AppIcons.iconsFilter,
                    width: 24,
                    height: 24,
                    colorFilter: const ColorFilter.mode(
                      AppColors.primaryColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              SearchTextField(),
              SizedBox(height: 60),
              AllMedicinesGridview(),
            ],
          ),
        ),
      ),
    );
  }
}
