import 'package:flutter/material.dart';
import 'package:pharmacy_app/features/medicine_details/presentation/views/widgets/medicine_details_view_body.dart';

class MedicineDetailsView extends StatelessWidget {
  const MedicineDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MedicineDetailsViewBody(),
    );
  }
}
