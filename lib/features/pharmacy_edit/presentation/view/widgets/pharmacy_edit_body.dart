import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:pharmacy_app/features/pharmacy_edit/presentation/view/widgets/pharmacy_edit_img.dart';
import 'package:pharmacy_app/features/pharmacy_edit/presentation/view_model/pharmacy_Edit_cubit/pharmacy_edit_cubit.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../all_branches/data/models/pharmacy_branch_model.dart';
import 'custom_edit_list.dart';

class PharmacyEditBody extends StatelessWidget {
  const PharmacyEditBody({super.key, required this.branch});
  final PharmacyBranchModel? branch;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PharmacyEditImg(pharmacyImg: branch?.image),
          CustomEditList(branch: branch),
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
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Branch added successfully!")),
                      );
                      Navigator.pop(context);
                    } else if (state is AddBranchError) {
                      log(state.apiErrorModel.message!);
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text(state.apiErrorModel.message!),
                            backgroundColor: Colors.red),
                      );
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
