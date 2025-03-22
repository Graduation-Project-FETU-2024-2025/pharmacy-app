
import 'package:dartz/dartz.dart';
import 'package:pharmacy_app/features/all_branches/data/data/pharmacy_branch_model.dart';



abstract class GetOneBranchRepo {
  Future<Either<String,PharmacyBranchModel>> getBranch(String branchId);
}
