import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/add_delete_button.dart';
import '../../../../../core/widgets/toast.dart';
import '../../../../../generated/l10n.dart';
import '../../../../all_medicines/data/models/medicine_branch_model.dart';
import '../../../../auth/presentation/views/widgets/loading_widget.dart';
import '../../view_models/delete_cubit/delete_cubit.dart';

class DeleteButtonConsumer extends StatelessWidget {
  const DeleteButtonConsumer({
    super.key,
    required this.medicineBranchModel,
  });
  final MedicineBranchModel medicineBranchModel;

  @override
  Widget build(BuildContext context) {
    final deleteCubit = DeleteCubit.get(context);
    return BlocConsumer<DeleteCubit, DeleteState>(
      listener: (context, state) {
        //String lang = getIt<CacheHelper>().getCurrentLanguage();
        if (state is DeleteSuccess) {
          successToast(message: state.successMessage);
        }
        if (state is DeleteFailure) {
          errorToast(message: state.apiErrorModel.message!);
        }
      },
      builder: (context, state) {
        return state is DeleteLoading
            ? const LoadingWidget()
            : AddDeleteButton(
                title: S.of(context).delete,
                color: state is DeleteSuccess
                    ? Colors.grey.withOpacity(0.3)
                    : AppColors.red,
                onpressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            actionsAlignment: MainAxisAlignment.center,
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(S.of(context).delete),
                                SizedBox(
                                  width: 10.h,
                                ),
                                Icon(
                                  Icons.priority_high,
                                  color: AppColors.red,
                                  size: 30.sp,
                                ),
                              ],
                            ),
                            content: Text(
                              S.of(context).areYouSureToDelete,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            actions: [
                              TextButton(
                                style: ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll(
                                    AppColors.red,
                                  ),
                                ),
                                onPressed: () {
                                  deleteCubit.deleteMedicine(
                                    branchId: medicineBranchModel.branchId,
                                    id: medicineBranchModel.productsDTO.code,
                                  );
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  S.of(context).yes,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              SizedBox(width: 20.w),
                              TextButton(
                                style: ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll(
                                    AppColors.gray,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  S.of(context).no,
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ],
                          ));
                },
              );
      },
    );
  }
}
