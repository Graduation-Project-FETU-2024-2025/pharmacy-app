import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:pharmacy_app/core/widgets/toast.dart';
import 'package:pharmacy_app/features/add_branch/presentation/view_model/pharmacy_Edit_cubit/pharmacy_edit_cubit.dart';
import 'package:pharmacy_app/features/all_branches/data/models/pharmacy_branch_model.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../generated/l10n.dart';
import 'custom_edit_list.dart';
import 'pharmacy_edit_img.dart';

class PharmacyEditBody extends StatelessWidget {
  const PharmacyEditBody({super.key, required this.branch});
  final PharmacyBranchModel branch;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PharmacyEditImg(pharmacyImg: branch.image),
          CustomEditList(branch: branch),
          Center(
            child: SizedBox(
                width: 120.w,
                height: 36.h,
                child: BlocConsumer<PharmacyEditCubit, PharmacyEditState>(
                  listener: (context, state) {
                    if (state is UpdateBranchLoading) {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (_) =>
                            Center(child: CircularProgressIndicator()),
                      );
                    } else if (state is UpdateBranchSuccess) {
                      Navigator.pop(context);
                      Navigator.pop(context, true);
                      successToast(message: S.of(context).successUpdatedBranch);
                    } else if (state is UpdateBranchFailure) {
                      Navigator.pop(context);
                      errorToast(message: state.apiErrorModel.message!);
                    }
                  },
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: state is UpdateBranchLoading
                          ? null
                          : () {
                              context
                                  .read<PharmacyEditCubit>()
                                  .updateBranch(branch.id);
                            },
                      child: state is UpdateBranchLoading
                          ? CircularProgressIndicator(color: Colors.white)
                          : Text(
                              S.of(context).save,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                      fontSize: 18, color: AppColors.white),
                            ),
                    );
                  },
                )),
          ),
          Gap(35.h)
        ],
      ),
    );
  }
}
