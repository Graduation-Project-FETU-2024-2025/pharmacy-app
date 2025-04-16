import 'package:dartz/dartz.dart';
import 'package:pharmacy_app/core/database/api/api_error_model.dart';
import 'package:pharmacy_app/features/home/data/models/last_added_response_model.dart';

abstract class LastAddedRepo {
  Future<Either<ApiErrorModel, LastAddedResponseModel>> getLastAddedMedicines();
}
