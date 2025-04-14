import 'package:dartz/dartz.dart';
import 'package:pharmacy_app/core/database/api/api_error_model.dart';
import 'package:pharmacy_app/features/all_medicines/data/models/get_branch_products_model.dart';

abstract class GetBranchProductsRepo {
  Future<Either<ApiErrorModel, GetBranchProductsModel>> getBranchProducts({
    required String branchId,
  });
  Future<Either<ApiErrorModel, GetBranchProductsModel>> searchInBranchProducts({
    required String branchId,
    required String query,
  });
}
