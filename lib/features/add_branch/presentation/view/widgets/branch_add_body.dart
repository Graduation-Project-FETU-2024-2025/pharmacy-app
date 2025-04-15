import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:pharmacy_app/features/branch_edit/presentation/view/widget/pharmacy_edit_img.dart';
import 'package:pharmacy_app/features/add_branch/presentation/view_model/pharmacy_Edit_cubit/pharmacy_edit_cubit.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/toast.dart';
import 'custom_add_list.dart';

class BranchAddBody extends StatelessWidget {
  const BranchAddBody({super.key});


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PharmacyEditImg(),
          CustomAddList(),
          Center(
            child: SizedBox(
                width: 120.w,
                height: 36.h,
                child: BlocConsumer<PharmacyEditCubit, PharmacyEditState>(
                  listener: (context, state) {
                    if (state is AddBranchLoading) {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (_) =>
                            Center(child: CircularProgressIndicator()),
                      );
                    } else if (state is AddBranchSuccess) {
                      Navigator.pop(context);
                      Navigator.pop(context, true);

                      successToast(message: "Branch added successfully");

                    } else if (state is AddBranchFailure) {
                      Navigator.pop(context);
                      errorToast(message: state.apiErrorModel.message!);
                    }
                  },
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: state is AddBranchLoading
                          ? null
                          : () {
                              context.read<PharmacyEditCubit>().addBranch();
                            },
                      child: state is AddBranchLoading
                          ? CircularProgressIndicator(color: Colors.white)
                          : Text(
                              "Save",
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
