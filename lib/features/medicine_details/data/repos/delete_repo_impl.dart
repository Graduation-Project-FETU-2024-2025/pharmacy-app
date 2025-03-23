import 'package:dartz/dartz.dart';
import 'package:pharmacy_app/core/database/api/api_consumer.dart';
import 'package:pharmacy_app/features/medicine_details/data/models/delete_response_model.dart';
import 'package:pharmacy_app/features/medicine_details/data/repos/delete_repo.dart';

import '../../../../core/database/api/end_points.dart';

class DeleteRepoImpl implements DeleteRepo {
  final ApiConsumer apiConsumer;

  DeleteRepoImpl({required this.apiConsumer});
  @override
  Future<Either<String, String>> deleteMedicine({
    required String branchId,
    required String id,
  }) async {
    try {
      final response = await apiConsumer.delete(
        '${EndPoints.deleteMedicine}$branchId/$id',
      );
      final data = DeleteResponseModel.fromJson(response.data);
      return Right(data.message);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
