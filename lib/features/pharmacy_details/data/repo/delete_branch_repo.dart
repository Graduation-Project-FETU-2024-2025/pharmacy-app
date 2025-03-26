
import 'package:dartz/dartz.dart';

import '../../../../core/database/api/api_error_model.dart';

abstract class DeleteBranchRepo {
  Future<Either<ApiErrorModel, bool>> deleteBranch(String branchId);
}
