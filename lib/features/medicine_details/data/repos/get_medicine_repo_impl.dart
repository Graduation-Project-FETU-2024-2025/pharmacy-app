import 'package:dartz/dartz.dart';
import 'package:pharmacy_app/core/database/api/api_consumer.dart';
import 'package:pharmacy_app/core/database/api/end_points.dart';
import 'package:pharmacy_app/features/medicine_details/data/models/get_medicine_response_model.dart';
import 'package:pharmacy_app/features/medicine_details/data/repos/get_medicine_repo.dart';

class GetMedicineRepoImpl implements GetMedicineRepo {
  final ApiConsumer apiConsumer;

  GetMedicineRepoImpl({required this.apiConsumer});
  @override
  Future<Either<String, GetMedicineResponseModel>> getMedicineDetails({
    required String branchId,
    required String id,
  }) async {
    try {
      final response =
          await apiConsumer.get("${EndPoints.getMedicine}/$branchId/$id");
      final data = GetMedicineResponseModel.fromJson(response.data);
      return Right(data);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
