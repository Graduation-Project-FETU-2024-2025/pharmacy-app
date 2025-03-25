import 'package:dartz/dartz.dart';
import 'package:pharmacy_app/core/database/api/api_error_model.dart';

import '../models/add_branch_model.dart';

abstract class AddBranchRepo {
  Future<Either<ApiErrorModel, AddBranchModel>> addBranch(AddBranchModel branch);
}