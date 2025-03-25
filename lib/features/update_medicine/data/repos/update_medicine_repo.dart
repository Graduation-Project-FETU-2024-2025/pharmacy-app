import 'package:dartz/dartz.dart';
import 'package:pharmacy_app/features/update_medicine/data/models/update_medicine_response_model.dart';

import '../models/update_medicine_request_model.dart';

abstract class UpdateMedicineRepo {
  Future<Either<String, UpdateMedicineResponseModel>> updateMedicine({
    required UpdateMedicineRequestModel data,
  });
}
