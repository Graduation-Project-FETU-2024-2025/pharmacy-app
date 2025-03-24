import 'package:dartz/dartz.dart';

import '../models/pharmacy_branch_model.dart';

abstract class GetBranchesRepo {
  Future<Either<String,List<PharmacyBranchModel>>> getAllBranches();
}
