import 'package:dartz/dartz.dart';
import 'package:pharmacy_app/core/database/api/end_points.dart';
import 'package:pharmacy_app/features/branch_edit/data/repo/edit_branch_repo.dart';

import '../../../../core/database/api/api_consumer.dart';
import '../../../../core/database/api/api_error_handler.dart';
import '../../../../core/database/api/api_error_model.dart';
import '../models/update_branch_model.dart';
import '../models/update_branch_response_model.dart';

class EditBranchRepoImpl implements EditBranchRepo {
  final ApiConsumer apiConsumer;

  EditBranchRepoImpl(this.apiConsumer);

  @override
  Future<Either<ApiErrorModel, UpdateBranchResponseModel>> updateBranch(
      UpdateBranchModel branch, String branchId) async {
    try {
      final response = await apiConsumer.put(
          '${EndPoints.getBranches}/$branchId',
          data: branch.toJson(),
          isFormData: true);
      return Right(UpdateBranchResponseModel.fromJson(response.data));
    } catch (error) {
      return Left(ApiErrorHandler.handleError(error));
    }
  }
}
