import 'package:dartz/dartz.dart';
import 'package:pharmacy_app/core/database/api/api_consumer.dart';
import 'package:pharmacy_app/core/database/api/api_error_handler.dart';
import 'package:pharmacy_app/core/database/api/api_error_model.dart';
import 'package:pharmacy_app/core/database/api/end_points.dart';
import 'package:pharmacy_app/features/home/data/models/out_of_stock_response_model.dart';
import 'package:pharmacy_app/features/home/data/repos/out_of_stock_repo.dart';

class OutOfStockRepoImpl implements OutOfStockRepo {
  final ApiConsumer apiConsumer;

  OutOfStockRepoImpl({required this.apiConsumer});
  @override
  Future<Either<ApiErrorModel, OutOfStockResponseModel>> getOutOfStock() async {
    try {
      final response = await apiConsumer.get(
        EndPoints.getOutOfStock,
        queryParameter: {
          "page": 1,
          "pageSize": 10,
        },
      );
      final data = OutOfStockResponseModel.fromJson(response.data);
      return Right(data);
    } catch (e) {
      return Left(ApiErrorHandler.handleError(e));
    }
  }
}
