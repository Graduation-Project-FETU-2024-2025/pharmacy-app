import 'package:dartz/dartz.dart';
import 'package:pharmacy_app/core/database/api/api_error_model.dart';

import '../models/add_branch_model.dart';
import '../models/add_branch_model_response.dart';

abstract class AddBranchRepo {
  Future<Either<ApiErrorModel, AddBranchModelResponse>> addBranch(AddBranchModel branch);
}