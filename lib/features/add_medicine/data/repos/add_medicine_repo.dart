import 'package:dartz/dartz.dart';
import 'package:pharmacy_app/features/add_medicine/data/models/add_medicine_request_model.dart';
import 'package:pharmacy_app/features/add_medicine/data/models/add_medicine_response_model.dart';

abstract class AddMedicineRepo {
  Future<Either<String, AddMedicineResponseModel>> addMedicine(
      {required AddMedicineRequestModel data});
}
