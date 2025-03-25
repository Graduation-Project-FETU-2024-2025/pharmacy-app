import 'package:flutter/material.dart';
import 'package:pharmacy_app/features/medicine_details/presentation/views/widgets/medicine_details_view_body.dart';

import '../../../all_medicines/data/models/medicine_branch_model.dart';

class MedicineDetailsView extends StatelessWidget {
  const MedicineDetailsView({super.key, required this.medicineBranchModel});
  final MedicineBranchModel medicineBranchModel;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;

        Navigator.of(context).pop(true);
      },
      child: Scaffold(
        body: MedicineDetailsViewBody(
          branchId: medicineBranchModel.branchId,
          id: medicineBranchModel.systemProductCode,
        ),
      ),
    );
  }
}
