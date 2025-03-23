import 'package:flutter/material.dart';
import 'package:pharmacy_app/features/add_medicine/presentation/views/widgets/system_medicine_view_body.dart';

class SystemMedicineView extends StatelessWidget {
  const SystemMedicineView({super.key, required this.branchId});
  final String branchId;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SystemMedicineViewBody(
          branchId: branchId,
        ),
      ),
    );
  }
}
