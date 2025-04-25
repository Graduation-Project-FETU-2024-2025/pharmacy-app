import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharmacy_app/core/helpers/extentions.dart';
import 'package:pharmacy_app/core/utils/app_icons.dart';
import 'package:pharmacy_app/core/utils/app_images.dart';
import '../../../../../core/routers/routing.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../data/models/pharmacy_branch_model.dart';
import '../../view_model/cubit/get_branches/get_branches_cubit.dart';

class BranchesCardItems extends StatelessWidget {
  const BranchesCardItems({super.key, required this.branches});
  final PharmacyBranchModel branches;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final cardColor = isDarkMode ? Colors.white24 : AppColors.primaryColor.withOpacity(0.2);
    return GestureDetector(
      onTap: () async {
        context
            .pushNamed(Routing.pharmacyDetail, argument: branches.id)
            .then((value) {
          if (value == true) {
            context.read<GetBranchesCubit>().fetchBranches();
          }
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: cardColor,
          ),
          child: Row(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(left: 15, top: 37, bottom: 31, right: 15),
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(branches.image))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 18, bottom: 7),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: Text(
                        branches.branchName,
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(color: AppColors.primaryColor),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        SvgPicture.asset(
                          AppIcons.iconsLocation,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(width: 5),
                        Text(
                          branches.address,
                          style: Theme.of(context).textTheme.bodySmall,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        SvgPicture.asset(
                          AppIcons.iconsPhone,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(width: 5),
                        Text(
                          branches.phoneNumber,
                          style: Theme.of(context).textTheme.bodySmall,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Image.asset(AppImages.imgCheckmark),
                        SizedBox(width: 5),
                        Text(
                          branches.status,
                          style: Theme.of(context).textTheme.bodySmall,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
