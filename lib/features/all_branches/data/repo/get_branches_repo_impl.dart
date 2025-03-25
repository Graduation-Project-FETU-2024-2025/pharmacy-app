import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../../core/database/api/end_points.dart';
import '../models/pharmacy_branch_model.dart';
import 'get_branches_repo.dart';
import 'package:pharmacy_app/core/database/api/api_consumer.dart';

class GetBranchesRepoImpl implements GetBranchesRepo {
  final ApiConsumer apiConsumer;

  GetBranchesRepoImpl(this.apiConsumer);

  @override
  Future<Either<String,List<PharmacyBranchModel>>> getAllBranches() async {
    try {

      final response = await apiConsumer.get(
        EndPoints.getBranches,
        queryParameter: {
          "page": 1,
          "pageSize": 10,
        },
      );

      List<dynamic> data = response.data["data"];
      return Right(data.map((json) => PharmacyBranchModel.fromJson(json)).toList());
    } catch (e) {
      log(e.toString());
      return Left('Failed to fetch pharmacies: $e');
    }
  }
}
