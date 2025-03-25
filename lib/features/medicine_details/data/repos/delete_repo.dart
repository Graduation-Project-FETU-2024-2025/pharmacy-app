import 'package:dartz/dartz.dart';
import 'package:pharmacy_app/core/database/api/api_error_model.dart';

abstract class DeleteRepo {
  Future<Either<ApiErrorModel, String>> deleteMedicine(
      {required String branchId, required String id});
}
