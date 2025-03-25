import 'package:dartz/dartz.dart';
import 'package:pharmacy_app/features/medicine_details/data/models/get_medicine_response_model.dart';

abstract class GetMedicineRepo {
  Future<Either<String, GetMedicineResponseModel>> getMedicineDetails(
      {required String branchId, required String id});
}
