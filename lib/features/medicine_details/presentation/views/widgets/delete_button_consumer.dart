import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/add_delete_button.dart';
import '../../../../../core/widgets/toast.dart';
import '../../../../../generated/l10n.dart';
import '../../../../all_medicines/data/models/medicine_branch_model.dart';
import '../../../../auth/presentation/views/widgets/loading_widget.dart';
import '../../view_models/cubit/delete_cubit.dart';

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
          errorToast(message: state.errorMessage);
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
                  deleteCubit.deleteMedicine(
                    branchId: medicineBranchModel.branchId,
                    id: medicineBranchModel.productsDTO.code,
                  );
                },
              );
      },
    );
  }
}
