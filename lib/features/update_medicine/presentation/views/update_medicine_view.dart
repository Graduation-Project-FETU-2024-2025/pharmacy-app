import 'package:flutter/material.dart';
import 'package:pharmacy_app/features/all_medicines/data/models/medicine_branch_model.dart';
import 'package:pharmacy_app/features/update_medicine/presentation/views/widgets/update_medicine_view_body.dart';

class UpdateMedicineView extends StatelessWidget {
  const UpdateMedicineView(
      {super.key, required this.branchId, required this.medicineBranchModel});
  final String branchId;
  final MedicineBranchModel medicineBranchModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UpdateMedicineViewBody(
        branchId: branchId,
        medicineBranchModel: medicineBranchModel,
      ),
    );
  }
}
