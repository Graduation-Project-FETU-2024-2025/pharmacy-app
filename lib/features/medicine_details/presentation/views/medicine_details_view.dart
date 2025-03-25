import 'package:flutter/material.dart';
import 'package:pharmacy_app/features/medicine_details/presentation/views/widgets/medicine_details_view_body.dart';

import '../../../all_medicines/data/models/medicine_branch_model.dart';

class MedicineDetailsView extends StatelessWidget {
  const MedicineDetailsView({super.key, required this.medicineBranchModel});
  final MedicineBranchModel medicineBranchModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MedicineDetailsViewBody(
        branchId: medicineBranchModel.branchId,
        id: medicineBranchModel.systemProductCode,
      ),
    );
  }
}
