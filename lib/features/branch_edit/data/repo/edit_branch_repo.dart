import 'package:dartz/dartz.dart';

import '../../../../core/database/api/api_error_model.dart';
import '../models/update_branch_model.dart';
import '../models/update_branch_response_model.dart';

abstract class EditBranchRepo {
  Future<Either<ApiErrorModel, UpdateBranchResponseModel>> updateBranch(UpdateBranchModel branch, String branchId);
}