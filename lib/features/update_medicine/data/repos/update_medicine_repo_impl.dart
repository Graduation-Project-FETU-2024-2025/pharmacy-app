import 'package:dartz/dartz.dart';
import 'package:pharmacy_app/core/database/api/api_consumer.dart';
import 'package:pharmacy_app/core/database/api/api_error_handler.dart';
import 'package:pharmacy_app/core/database/api/api_error_model.dart';
import 'package:pharmacy_app/core/database/api/end_points.dart';
import 'package:pharmacy_app/features/update_medicine/data/models/update_medicine_request_model.dart';
import 'package:pharmacy_app/features/update_medicine/data/models/update_medicine_response_model.dart';
import 'package:pharmacy_app/features/update_medicine/data/repos/update_medicine_repo.dart';

class UpdateMedicineRepoImpl implements UpdateMedicineRepo {
  final ApiConsumer apiConsumer;

  UpdateMedicineRepoImpl({required this.apiConsumer});
  @override
  Future<Either<ApiErrorModel, UpdateMedicineResponseModel>> updateMedicine(
      {required UpdateMedicineRequestModel data}) async {
    try {
      final response = await apiConsumer.put(
        "${EndPoints.updateMedicine}/${data.branchId}/${data.systemProductCode}",
        data: data.toJson(),
      );
      final updateResponse = UpdateMedicineResponseModel.fromJson(
        response.data,
      );
      return Right(updateResponse);
    } catch (e) {
      return Left(ApiErrorHandler.handleError(e));
    }
  }
}
