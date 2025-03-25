import 'package:dartz/dartz.dart';
import 'package:pharmacy_app/core/database/api/api_error_handler.dart';
import 'package:pharmacy_app/core/database/api/api_error_model.dart';
import 'package:pharmacy_app/features/pharmacy_details/data/repo/delete_branch_repo.dart';

import '../../../../core/database/api/api_consumer.dart';
import '../../../../core/database/api/end_points.dart';

class DeleteBranchRepoImpl implements DeleteBranchRepo {
  final ApiConsumer apiConsumer;

  DeleteBranchRepoImpl(this.apiConsumer);

  @override
  Future<Either<ApiErrorModel, bool>> deleteBranch(String branchId) async {
    try {
      final response = await apiConsumer.delete(
        '${EndPoints.getBranches}/$branchId',
      );
      if (response.statusCode == 200) {
        return Right(true);
      } else{
          return Left(ApiErrorHandler.handleError(response.message));
      }
    } catch (e) {
      return Left(ApiErrorHandler.handleError(e));
    }
  }
}
