import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:pharmacy_app/core/helpers/extentions.dart';
import 'package:pharmacy_app/core/routers/routing.dart';
import 'package:pharmacy_app/core/utils/app_colors.dart';
import 'package:pharmacy_app/core/utils/app_icons.dart';
import 'package:pharmacy_app/features/all_branches/data/models/pharmacy_branch_model.dart';
import '../../../../all_branches/presentation/view_model/cubit/get_branches/get_branches_cubit.dart';
import 'delete_button.dart';

class RowBtn extends StatelessWidget {
  const RowBtn({super.key, required this.branch});
  final PharmacyBranchModel branch;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DeleteButton(branchId: branch.id),
        Gap(35.w),
        SizedBox(
          width: 40.w,
          height: 40.h,
          child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    const WidgetStatePropertyAll(AppColors.primaryColor),
                shape: WidgetStatePropertyAll(
                  const CircleBorder(),
                ),
                padding: const WidgetStatePropertyAll(
                  EdgeInsets.all(10),
                ),
              ),
              onPressed: () {
                context
                    .pushNamed(Routing.branchEdit, argument: branch)
                    .then((value) {
                  if (value == true) {
                    context.read<GetBranchesCubit>().fetchBranches();
                  }
                });
              },
              child: SvgPicture.asset(
                AppIcons.iconsEdit,
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.dst),
              )),
        ),
      ],
    );
  }
}
