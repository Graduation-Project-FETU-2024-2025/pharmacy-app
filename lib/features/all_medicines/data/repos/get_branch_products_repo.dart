import 'package:dartz/dartz.dart';
import 'package:pharmacy_app/features/all_medicines/data/models/get_branch_products_model.dart';

abstract class GetBranchProductsRepo {
  Future<Either<String, GetBranchProductsModel>> getBranchProducts({
    required String branchId,
  });
}
