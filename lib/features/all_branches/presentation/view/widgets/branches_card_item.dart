import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharmacy_app/core/utils/app_icons.dart';
import 'package:pharmacy_app/core/utils/app_images.dart';
import 'package:pharmacy_app/features/all_branches/presentation/view_model/models/branch_model.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../generated/l10n.dart';

class BranchesCardItems extends StatelessWidget {
  const BranchesCardItems({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> branchJson = {
  "branchName": S.of(context).drStonePharmacy,
  "branchLocation": S.of(context).locateEgTanEstad,
  "branchPhone": "+20 1553258966",
  "deliveryOption": S.of(context).freeDelivery,
  "branchImagePath": AppImages.imgPharmacy,
};

BranchModel branchFromJson = BranchModel.fromJson(branchJson);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: AppColors.primaryColor.withOpacity(0.2),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15, top: 37, bottom: 31 ,right: 15),
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(branchFromJson.branchImagePath))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 18, bottom: 7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.55,
                    child: Text(
                      branchFromJson.branchName,
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColors.primaryColor),
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
                        branchFromJson.branchLocation,
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
                        branchFromJson.branchPhone,
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
                        branchFromJson.deliveryOption,
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
    );
  }
}





















