import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pharmacy_app/core/database/api/api_error_model.dart';
import 'package:pharmacy_app/features/update_medicine/data/models/update_medicine_request_model.dart';
import 'package:pharmacy_app/features/update_medicine/data/repos/update_medicine_repo.dart';

part 'update_medcine_state.dart';

class UpdateMedcineCubit extends Cubit<UpdateMedcineState> {
  UpdateMedcineCubit(this.updateMedicineRepo) : super(UpdateMedcineInitial());
  static UpdateMedcineCubit get(context) => BlocProvider.of(context);
  final TextEditingController medicinePriceController = TextEditingController();
  final TextEditingController medicineStockController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final UpdateMedicineRepo updateMedicineRepo;

  void updateMedicine({
    required String branchId,
    required String id,
  }) async {
    emit(
      UpdateMedcineLoading(),
    );
    final result = await updateMedicineRepo.updateMedicine(
      data: UpdateMedicineRequestModel(
          branchId: branchId,
          systemProductCode: id,
          stock: int.parse(medicineStockController.text),
          price: double.parse(medicinePriceController.text),
          visibility: true),
    );
    result.fold(
      (apiErrorModel) => emit(
        UpdateMedcineFailure(apiErrorModel: apiErrorModel),
      ),
      (ifRight) => emit(
        UpdateMedcineSuccess(),
      ),
    );
  }

  void setInitialValues({required String price, required String stock}) {
    medicinePriceController.text = price;
    medicineStockController.text = stock;
  }

  @override
  Future<void> close() {
    medicinePriceController.dispose();
    medicineStockController.dispose();
    return super.close();
  }
}
