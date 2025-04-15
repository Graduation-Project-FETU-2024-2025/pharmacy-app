import 'package:dartz/dartz.dart';

import '../../../../core/database/api/api_error_model.dart';
import '../models/update_branch_model.dart';

abstract class EditBranchRepo {
  Future<Either<ApiErrorModel, bool>> updateBranch(UpdateBranchModel branch, String branchId);
}