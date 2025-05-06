import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharmacy_app/core/database/cache/cache_keys.dart';
import 'package:pharmacy_app/core/database/cache/cashe_helper.dart';
import 'package:pharmacy_app/core/services/get_it.dart';
import 'package:pharmacy_app/core/utils/app_colors.dart';
import 'package:pharmacy_app/core/utils/app_icons.dart';
import 'package:pharmacy_app/core/widgets/add_delete_button.dart';
import 'package:pharmacy_app/core/widgets/toast.dart';
import 'package:pharmacy_app/features/add_medicine/presentation/view_models/cubit/add_medicine_cubit.dart';
import 'package:pharmacy_app/features/add_medicine/presentation/views/widgets/text_add_med_form.dart';
import 'package:pharmacy_app/features/all_medicines/data/models/medicine_branch_model.dart';
import 'package:pharmacy_app/features/auth/presentation/views/widgets/loading_widget.dart';
import 'package:pharmacy_app/features/update_medicine/presentation/view_models/update_medicine/update_medcine_cubit.dart';
import 'package:pharmacy_app/generated/l10n.dart';

class UpdateMedicineViewBody extends StatelessWidget {
  const UpdateMedicineViewBody(
      {super.key, required this.branchId, required this.medicineBranchModel});
  final String branchId;
  final MedicineBranchModel medicineBranchModel;

  @override
  Widget build(BuildContext context) {
    final updateCubit = UpdateMedcineCubit.get(context);
    String lang =
        getIt<CacheHelper>().getString(key: CacheKeys.currentLanguage) ?? 'en';
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
          child: Form(
            key: updateCubit.formKey,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      lang == 'en'
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
                            backgroundImage: CachedNetworkImageProvider(
                              medicineBranchModel.productsDTO.image,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 50.w,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  height: 24.h,
                ),
                TextAddMedForm(
                  label: S.of(context).medicineName,
                  hintText: lang == 'ar'
                      ? medicineBranchModel.productsDTO.arName
                      : medicineBranchModel.productsDTO.enName,
                  readOnly: true,
                ),
                SizedBox(
                  height: 24.h,
                ),
                TextAddMedForm(
                  label: S.of(context).DoageForm,
                  hintText: medicineBranchModel.productsDTO.type,
                  readOnly: true,
                ),
                SizedBox(
                  height: 24.h,
                ),
                TextAddMedForm(
                  label: S.of(context).activeSubstance,
                  hintText: medicineBranchModel.productsDTO.activePrincipal,
                  readOnly: true,
                ),
                SizedBox(
                  height: 24.h,
                ),
                TextAddMedForm(
                  label: S.of(context).manufacturer,
                  hintText: medicineBranchModel.productsDTO.companyName,
                  readOnly: true,
                ),
                SizedBox(
                  height: 24.h,
                ),
                TextAddMedForm(
                  label: S.of(context).price,
                  keyboardType: TextInputType.number,
                  hintText: medicineBranchModel.price.toString(),
                  readOnly: false,
                  initValue: medicineBranchModel.price.toString(),
                  controller: updateCubit.medicinePriceController,
                ),
                SizedBox(
                  height: 24.h,
                ),
                TextAddMedForm(
                  label: S.of(context).quantity,
                  hintText: medicineBranchModel.stock.toString(),
                  keyboardType: TextInputType.number,
                  readOnly: false,
                  initValue: medicineBranchModel.stock.toString(),
                  controller: updateCubit.medicineStockController,
                ),
                SizedBox(
                  height: 24.h,
                ),
                SizedBox(
                  height: 32.h,
                ),
                SizedBox(
                  height: 35.h,
                  width: 120.w,
                  child: BlocConsumer<UpdateMedcineCubit, UpdateMedcineState>(
                    listener: (context, state) {
                      if (state is UpdateMedcineSuccess) {
                        successToast(message: S.of(context).updateMedSuccess);
                        Navigator.pop(context, true);
                      }
                      if (state is UpdateMedcineFailure) {
                        errorToast(message: S.of(context).updateMedFail);
                      }
                    },
                    builder: (context, state) {
                      return state is UpdateMedcineLoading
                          ? LoadingWidget()
                          : AddDeleteButton(
                              title: S.of(context).update,
                              color: state is AddMedicineSuccess
                                  ? Colors.grey.withOpacity(0.3)
                                  : AppColors.primaryColor,
                              onpressed: () {
                                context
                                    .read<UpdateMedcineCubit>()
                                    .updateMedicine(
                                      branchId: branchId,
                                      id: medicineBranchModel.systemProductCode,
                                    );
                              },
                            );
                    },
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
