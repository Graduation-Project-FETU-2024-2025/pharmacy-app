import 'package:dartz/dartz.dart';
import 'package:pharmacy_app/core/database/api/api_error_model.dart';
import 'package:pharmacy_app/features/add_medicine/data/models/system_medicine_response_model.dart';

abstract class GetSystemMedicinesRepo {
  Future<Either<ApiErrorModel, SystemMedicineResponseModel>>
      getSystemMedicines();
}
