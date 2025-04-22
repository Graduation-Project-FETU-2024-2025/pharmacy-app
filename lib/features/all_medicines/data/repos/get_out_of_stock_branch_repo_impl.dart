import 'package:dartz/dartz.dart';
import 'package:pharmacy_app/core/database/api/api_consumer.dart';
import 'package:pharmacy_app/core/database/api/api_error_handler.dart';
import 'package:pharmacy_app/core/database/api/api_error_model.dart';
import 'package:pharmacy_app/core/database/api/end_points.dart';
import 'package:pharmacy_app/features/all_medicines/data/repos/get_out_of_stock_branch_repo.dart';
import 'package:pharmacy_app/features/home/data/models/out_of_stock_response_model.dart';

class GetOutOfStockBranchRepoImpl implements GetOutOfStockBranchRepo {
  final ApiConsumer apiConsumer;

  GetOutOfStockBranchRepoImpl({required this.apiConsumer});
  @override
  Future<Either<ApiErrorModel, OutOfStockResponseModel>>
      fetechOutOfStockBranch({
    required String branchId,
  }) async {
    try {
      final response = await apiConsumer.get(
        EndPoints.getOutOfStock,
        queryParameter: {"page": 1, "pageSize": 10, "branch_id": branchId},
      );
      if (response.statusCode == 204) {
        return right(OutOfStockResponseModel(
          data: [],
          message: "No products found",
          statusCode: 204,
        ));
      }
      final data = OutOfStockResponseModel.fromJson(response.data);
      return Right(data);
    } catch (e) {
      return Left(ApiErrorHandler.handleError(e));
    }
  }
}
