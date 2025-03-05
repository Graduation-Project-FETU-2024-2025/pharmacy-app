import 'package:flutter/material.dart';
import 'package:pharmacy_app/features/add_medicine/presentation/views/widgets/add_medicine_view_body.dart';

class AddMedicineView extends StatelessWidget {
  const AddMedicineView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AddMedicineViewBody(),
    );
  }
}
