import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:pharmacy_app/core/database/api/api_consumer.dart';
import 'package:pharmacy_app/features/all_branches/data/data/pharmacy_branch_model.dart';
import 'package:pharmacy_app/features/pharmacy_details/data/repo/get_one_branch_repo.dart';
import '../../../../core/database/api/end_points.dart';

class GetOneBranchRepoImpl implements GetOneBranchRepo {
  final ApiConsumer apiConsumer;

  GetOneBranchRepoImpl(this.apiConsumer);

  @override
  Future<Either<String, PharmacyBranchModel>> getBranch(String branchId) async {
    try {
      final response = await apiConsumer.get(
        '${EndPoints.getBranches}/$branchId',
      );

      return Right(PharmacyBranchModel.fromJson(response.data['data']));
    } catch (e) {
      log(e.toString());
      return Left('Failed to fetch branch details: $e');
    }
  }
}
