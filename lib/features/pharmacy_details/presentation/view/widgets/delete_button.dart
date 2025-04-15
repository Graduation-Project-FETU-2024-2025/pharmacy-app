import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/toast.dart';
import '../../../../../generated/l10n.dart';
import '../../view_model/delete_branch/delete_branch_cubit.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({
    super.key,
    required this.branchId,
  });

  final String branchId;

  @override
  Widget build(BuildContext context) {
    final deleteCubit = context.read<DeleteBranchCubit>();

    return BlocConsumer<DeleteBranchCubit, DeleteBranchState>(
      listener: (context, state) {
        if (state is DeleteBranchSuccess) {
          successToast(message: S.of(context).successDeleteBranch);
          Navigator.pop(context, true);
        }
        if (state is DeleteBranchFailure) {
          errorToast(message: state.apiErrorModel.message!);
        }
      },
      builder: (context, state) {
        return SizedBox(
          width: 120.w,
          height: 36.h,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(
                state is DeleteBranchSuccess
                    ? Colors.grey.withOpacity(0.3)
                    : AppColors.red,
              ),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            onPressed: state is DeleteBranchLoading
                ? null
                : () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        actionsAlignment: MainAxisAlignment.center,
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(S.of(context).delete),
                            SizedBox(width: 10.h),
                            Icon(Icons.priority_high,
                                color: AppColors.red, size: 30.sp),
                          ],
                        ),
                        content: Text(
                          S.of(context).wantToDeleteBranch,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        actions: [
                          TextButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  WidgetStatePropertyAll(AppColors.red),
                            ),
                            onPressed: () {
                              deleteCubit.deleteBranch(branchId);
                              Navigator.pop(context);
                            },
                            child: Text(S.of(context).yes,
                                style: TextStyle(color: Colors.white)),
                          ),
                          SizedBox(width: 20.w),
                          TextButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  WidgetStatePropertyAll(AppColors.gray),
                            ),
                            onPressed: () => Navigator.pop(context),
                            child: Text(S.of(context).no,
                                style: TextStyle(color: Colors.black)),
                          ),
                        ],
                      ),
                    );
                  },
            child: Text(
              S.of(context).delete,
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(fontSize: 18, color: AppColors.white),
            ),
          ),
        );
      },
    );
  }
}
