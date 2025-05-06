import 'package:dartz/dartz.dart';
import 'package:pharmacy_app/core/database/api/api_consumer.dart';
import 'package:pharmacy_app/core/database/api/api_error_handler.dart';
import 'package:pharmacy_app/core/database/api/api_error_model.dart';
import 'package:pharmacy_app/core/database/api/end_points.dart';
import 'package:pharmacy_app/features/all_medicines/data/repos/get_last_added_branch_repo.dart';
import 'package:pharmacy_app/features/home/data/models/last_added_response_model.dart';

class GetLastAddedBranchRepoImpl implements GetLastAddedBranchRepo {
  final ApiConsumer apiConsumer;

  GetLastAddedBranchRepoImpl({required this.apiConsumer});
  @override
  Future<Either<ApiErrorModel, LastAddedResponseModel>>
      fetchLastAddedBranch() async {
    try {
      final response = await apiConsumer.get(
        EndPoints.getLastAdded,
      );
      if (response.statusCode == 204) {
        return right(LastAddedResponseModel(
          data: [],
          message: "No products found",
          statusCode: 204,
        ));
      }
      final data = LastAddedResponseModel.fromJson(response.data);
      return Right(data);
    } catch (e) {
      return Left(ApiErrorHandler.handleError(e));
    }
  }
}
