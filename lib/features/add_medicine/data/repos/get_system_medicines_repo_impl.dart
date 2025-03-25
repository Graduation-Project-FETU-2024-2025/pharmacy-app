import 'package:dartz/dartz.dart';
import 'package:pharmacy_app/core/database/api/api_consumer.dart';
import 'package:pharmacy_app/core/database/api/api_error_handler.dart';
import 'package:pharmacy_app/core/database/api/api_error_model.dart';
import 'package:pharmacy_app/core/database/api/end_points.dart';
import 'package:pharmacy_app/features/add_medicine/data/models/system_medicine_response_model.dart';
import 'package:pharmacy_app/features/add_medicine/data/repos/get_system_medicines_repo.dart';

class GetSystemMedicinesRepoImpl implements GetSystemMedicinesRepo {
  final ApiConsumer apiConsumer;

  GetSystemMedicinesRepoImpl({required this.apiConsumer});
  @override
  Future<Either<ApiErrorModel, SystemMedicineResponseModel>>
      getSystemMedicines() async {
    try {
      final response = await apiConsumer
          .get(EndPoints.getAllSystemMedicines, queryParameter: {
        "page": 1,
        "pageSize": 10,
      });
      final data = SystemMedicineResponseModel.fromJson(response.data);
      return Right(data);
    } catch (e) {
      return Left(
        ApiErrorHandler.handleError(e),
      );
    }
  }
}
