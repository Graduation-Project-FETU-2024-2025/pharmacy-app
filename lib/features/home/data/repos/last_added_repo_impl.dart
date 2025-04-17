import 'package:dartz/dartz.dart';
import 'package:pharmacy_app/core/database/api/api_consumer.dart';
import 'package:pharmacy_app/core/database/api/api_error_handler.dart';
import 'package:pharmacy_app/core/database/api/api_error_model.dart';
import 'package:pharmacy_app/core/database/api/end_points.dart';
import 'package:pharmacy_app/features/home/data/models/last_added_response_model.dart';
import 'package:pharmacy_app/features/home/data/repos/last_added_repo.dart';

class LastAddedRepoImpl implements LastAddedRepo {
  final ApiConsumer apiConsumer;

  LastAddedRepoImpl({required this.apiConsumer});
  @override
  Future<Either<ApiErrorModel, LastAddedResponseModel>>
      getLastAddedMedicines() async {
    try {
      final response = await apiConsumer.get(
        EndPoints.getLastAdded,
        queryParameter: {
          "page": 1,
          "pageSize": 10,
        },
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
