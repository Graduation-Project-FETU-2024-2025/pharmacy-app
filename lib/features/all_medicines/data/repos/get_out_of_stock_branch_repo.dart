import 'package:dartz/dartz.dart';
import 'package:pharmacy_app/core/database/api/api_error_model.dart';
import 'package:pharmacy_app/features/home/data/models/out_of_stock_response_model.dart';

abstract class GetOutOfStockBranchRepo {
  Future<Either<ApiErrorModel, OutOfStockResponseModel>> fetechOutOfStockBranch(
      {required String branchId});
}
