import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharmacy_app/core/services/get_it.dart';
import 'package:pharmacy_app/core/utils/app_icons.dart';
import 'package:pharmacy_app/core/widgets/add_delete_button.dart';
import 'package:pharmacy_app/core/widgets/toast.dart';
import 'package:pharmacy_app/features/add_medicine/data/models/system_medicine_model.dart';
import 'package:pharmacy_app/features/add_medicine/presentation/view_models/cubit/add_medicine_cubit.dart';
import 'package:pharmacy_app/features/auth/presentation/views/widgets/loading_widget.dart';
import '../../../../../core/database/cache/cashe_helper.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../generated/l10n.dart';
import 'text_add_med_form.dart';

class AddMedicineViewBody extends StatelessWidget {
  const AddMedicineViewBody(
      {super.key, required this.systemMedicineModel, required this.branchId});
  final SystemMedicineModel systemMedicineModel;
  final String branchId;
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
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Row(
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
                                systemMedicineModel.image),
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
                  hintText: systemMedicineModel.name,
                  readOnly: true,
                ),
                SizedBox(
                  height: 24.h,
                ),
                TextAddMedForm(
                  label: S.of(context).DoageForm,
                  hintText: systemMedicineModel.type,
                  readOnly: true,
                ),
                SizedBox(
                  height: 24.h,
                ),
                TextAddMedForm(
                  label: S.of(context).activeSubstance,
                  hintText: systemMedicineModel.activePrincipal,
                  readOnly: true,
                ),
                SizedBox(
                  height: 24.h,
                ),
                TextAddMedForm(
                  label: S.of(context).manufacturer,
                  hintText: systemMedicineModel.companyName,
                  readOnly: true,
                ),
                SizedBox(
                  height: 24.h,
                ),
                TextAddMedForm(
                  label: S.of(context).price,
                  keyboardType: TextInputType.number,
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
                  keyboardType: TextInputType.number,
                  readOnly: false,
                  controller:
                      AddMedicineCubit.get(context).medicineStockController,
                ),
                SizedBox(
                  height: 56.h,
                ),
                SizedBox(
                  height: 35.h,
                  width: 120.w,
                  child: BlocConsumer<AddMedicineCubit, AddMedicineState>(
                    listener: (context, state) {
                      if (state is AddMedicineSuccess) {
                        successToast(message: S.of(context).addMedSuccess);
                        Navigator.pop(context);
                      }
                      if (state is AddMedicineFailure) {
                        errorToast(message: state.apiErrorModel.message!);
                      }
                    },
                    builder: (context, state) {
                      return state is AddMedicineLoading
                          ? LoadingWidget()
                          : AddDeleteButton(
                              title: S.of(context).add,
                              color: state is AddMedicineSuccess
                                  ? Colors.grey.withOpacity(0.3)
                                  : AppColors.primaryColor,
                              onpressed: () {
                                if (AddMedicineCubit.get(context)
                                    .formKey
                                    .currentState!
                                    .validate()) {
                                  context.read<AddMedicineCubit>().addMedicine(
                                        branchId: branchId,
                                        medicineCode: systemMedicineModel.code,
                                      );
                                }
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
