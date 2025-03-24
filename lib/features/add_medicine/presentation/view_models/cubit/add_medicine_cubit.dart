import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pharmacy_app/features/add_medicine/data/models/add_medicine_request_model.dart';
import 'package:pharmacy_app/features/add_medicine/data/repos/add_medicine_repo.dart';
part 'add_medicine_state.dart';

class AddMedicineCubit extends Cubit<AddMedicineState> {
  AddMedicineCubit(this.addMedicineRepo) : super(AddMedicineInitial());
  static AddMedicineCubit get(context) => BlocProvider.of(context);
  final TextEditingController medicinePriceController = TextEditingController();
  final TextEditingController medicineStockController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final AddMedicineRepo addMedicineRepo;

  void addMedicine({
    required String branchId,
    required String medicineCode,
  }) async {
    final result = await addMedicineRepo.addMedicine(
      data: AddMedicineRequestModel(
        branchId: branchId,
        systemProductCode: medicineCode,
        stock: int.parse(medicineStockController.text),
        price: double.parse(medicinePriceController.text),
        visibility: true,
      ),
    );
    result.fold(
      (errorMessage) => emit(
        AddMedicineFailure(errorMessage: errorMessage),
      ),
      (successMessage) => emit(
        AddMedicineSuccess(),
      ),
    );
  }

  @override
  Future<void> close() {
    medicinePriceController.dispose();
    medicineStockController.dispose();
    return super.close();
  }
}
