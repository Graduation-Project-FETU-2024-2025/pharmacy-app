import 'package:dartz/dartz.dart';
import 'package:pharmacy_app/core/database/api/api_error_model.dart';
import 'package:pharmacy_app/features/all_branches/data/models/pharmacy_branch_model.dart';

abstract class GetOneBranchRepo {
  Future<Either<ApiErrorModel, PharmacyBranchModel>> getBranch(String branchId);
}
