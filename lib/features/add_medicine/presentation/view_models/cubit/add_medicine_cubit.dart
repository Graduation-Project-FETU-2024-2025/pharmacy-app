import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'add_medicine_state.dart';

class AddMedicineCubit extends Cubit<AddMedicineState> {
  AddMedicineCubit() : super(AddMedicineInitial());

  static AddMedicineCubit get(context) => BlocProvider.of(context);

  final TextEditingController medicinePriceController = TextEditingController();
  final TextEditingController medicineStockController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Future<void> close() {
    medicinePriceController.dispose();
    medicineStockController.dispose();
    return super.close();
  }
}
