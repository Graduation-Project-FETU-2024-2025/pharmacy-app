import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharmacy_app/core/services/get_it.dart';
import 'package:pharmacy_app/core/utils/app_icons.dart';
import 'package:pharmacy_app/core/widgets/add_delete_button.dart';
import 'package:pharmacy_app/features/add_medicine/presentation/view_models/cubit/add_medicine_cubit.dart';
import 'package:pharmacy_app/features/add_medicine/presentation/views/widgets/choose_branch.dart';
import '../../../../../core/database/cache/cashe_helper.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../generated/l10n.dart';
import 'text_add_med_form.dart';

class AddMedicineViewBody extends StatelessWidget {
  const AddMedicineViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
          child: Form(
            key: AddMedicineCubit.get(context).formKey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getIt<CacheHelper>().getCurrentLanguage() == 'en'
                        ? SvgPicture.asset(
                            AppIcons.iconsBack,
                            height: 32,
                            width: 32,
                          )
                        : SvgPicture.asset(
                            AppIcons.iconsBackRight,
                            height: 32,
                            width: 32,
                          ),
                    // SizedBox(
                    //   width: 40.w,
                    // ),
                    Column(
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          S.of(context).medicineInformation,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        CircleAvatar(
                          radius: 45.r,
                          backgroundImage: AssetImage(AppImages.imgMedicine),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 50.w,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  height: 24.h,
                ),
                TextAddMedForm(
                  label: S.of(context).medicineName,
                  hintText: 'Enter Quantity',
                  readOnly: true,
                ),
                SizedBox(
                  height: 24.h,
                ),
                TextAddMedForm(
                  label: S.of(context).form,
                  hintText: 'Enter Quantity',
                  readOnly: true,
                ),
                SizedBox(
                  height: 24.h,
                ),
                TextAddMedForm(
                  label: S.of(context).DoageForm,
                  hintText: 'Enter Quantity',
                  readOnly: true,
                ),
                SizedBox(
                  height: 24.h,
                ),
                TextAddMedForm(
                  label: S.of(context).activeSubstance,
                  hintText: 'Enter Quantity',
                  readOnly: true,
                ),
                SizedBox(
                  height: 24.h,
                ),
                TextAddMedForm(
                  label: S.of(context).manufacturer,
                  hintText: 'Enter Quantity',
                  readOnly: true,
                ),
                SizedBox(
                  height: 24.h,
                ),
                TextAddMedForm(
                  label: S.of(context).price,
                  hintText: S.of(context).enterPrice,
                  readOnly: false,
                  controller:
                      AddMedicineCubit.get(context).medicinePriceController,
                ),
                SizedBox(
                  height: 24.h,
                ),
                TextAddMedForm(
                  label: S.of(context).quantity,
                  hintText: S.of(context).enterQuantity,
                  readOnly: false,
                  controller:
                      AddMedicineCubit.get(context).medicineStockController,
                ),
                SizedBox(
                  height: 24.h,
                ),
                ChooseBranch(),
                SizedBox(
                  height: 32.h,
                ),
                SizedBox(
                  height: 35.h,
                  width: 120.w,
                  child: AddDeleteButton(
                    title: S.of(context).save,
                    color: AppColors.primaryColor,
                    onpressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
