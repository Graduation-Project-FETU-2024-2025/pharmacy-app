import 'package:dartz/dartz.dart';

import '../models/add_branch_model.dart';

abstract class AddBranchRepo {
  Future<Either<String, AddBranchModel>> addBranch(AddBranchModel branch);
}