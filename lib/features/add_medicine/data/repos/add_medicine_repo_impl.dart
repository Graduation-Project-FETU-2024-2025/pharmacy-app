import 'package:dartz/dartz.dart';
import 'package:pharmacy_app/core/database/api/api_consumer.dart';
import 'package:pharmacy_app/core/database/api/api_error_handler.dart';
import 'package:pharmacy_app/core/database/api/api_error_model.dart';
import 'package:pharmacy_app/core/database/api/end_points.dart';
import 'package:pharmacy_app/features/add_medicine/data/models/add_medicine_request_model.dart';
import 'package:pharmacy_app/features/add_medicine/data/models/add_medicine_response_model.dart';
import 'package:pharmacy_app/features/add_medicine/data/repos/add_medicine_repo.dart';

class AddMedicineRepoImpl implements AddMedicineRepo {
  final ApiConsumer apiConsumer;

  AddMedicineRepoImpl({required this.apiConsumer});
  @override
  Future<Either<ApiErrorModel, AddMedicineResponseModel>> addMedicine(
      {required AddMedicineRequestModel data}) async {
    try {
      final response = await apiConsumer.post(
        EndPoints.addMedicine,
        data: data.toJson(),
      );
      final addMedicineData = AddMedicineResponseModel.fromJson(
        response.data,
      );
      return Right(addMedicineData);
    } catch (e) {
      return Left(
        ApiErrorHandler.handleError(e),
      );
    }
  }
}
