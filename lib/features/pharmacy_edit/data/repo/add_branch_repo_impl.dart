import 'package:dartz/dartz.dart';
import 'package:pharmacy_app/core/database/api/api_error_handler.dart';
import 'package:pharmacy_app/core/database/api/api_error_model.dart';
import 'package:pharmacy_app/core/database/api/end_points.dart';
import 'package:pharmacy_app/features/pharmacy_edit/data/models/add_branch_model_response.dart';

import '../../../../core/database/api/api_consumer.dart';
import '../models/add_branch_model.dart';
import 'add_branch_repo.dart';

class AddBranchRepoImpl implements AddBranchRepo {
  final ApiConsumer apiConsumer;

  AddBranchRepoImpl(this.apiConsumer);

  @override
  Future<Either<ApiErrorModel, AddBranchModelResponse>> addBranch(
      AddBranchModel branch) async {
    try {
      final response = await apiConsumer.post(
        EndPoints.getBranches,
        data: branch.toJson(),
      );
      final branchModel = AddBranchModelResponse.fromJson(response.data['data']);
      return Right(branchModel);
    } catch (e) {
      return Left(ApiErrorHandler.handleError(e));
    }
  }
}
