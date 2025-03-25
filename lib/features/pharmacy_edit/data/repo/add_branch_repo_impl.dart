import 'package:dartz/dartz.dart';
import 'package:pharmacy_app/core/database/api/end_points.dart';

import '../../../../core/database/api/api_consumer.dart';
import '../models/add_branch_model.dart';
import 'add_branch_repo.dart';

class AddBranchRepoImpl implements AddBranchRepo {
  final ApiConsumer apiConsumer;

  AddBranchRepoImpl(this.apiConsumer);

  @override
  Future<Either<String, AddBranchModel>> addBranch(
      AddBranchModel branch) async {
    try {
      final response = await apiConsumer.post(
        EndPoints.getBranches,
        data: branch.toJson(),
      );
      final branchModel = AddBranchModel.fromJson(response['data']);
      return Right(branchModel);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
