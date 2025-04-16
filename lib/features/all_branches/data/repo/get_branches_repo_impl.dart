import 'package:dartz/dartz.dart';
import 'package:pharmacy_app/core/database/api/api_error_handler.dart';
import 'package:pharmacy_app/core/database/api/api_error_model.dart';
import '../../../../core/database/api/end_points.dart';
import '../models/pharmacy_branch_model.dart';
import 'get_branches_repo.dart';
import 'package:pharmacy_app/core/database/api/api_consumer.dart';

class GetBranchesRepoImpl implements GetBranchesRepo {
  final ApiConsumer apiConsumer;

  GetBranchesRepoImpl(this.apiConsumer);

  @override
  Future<Either<ApiErrorModel, List<PharmacyBranchModel>>>
      getAllBranches() async {
    try {
      final response = await apiConsumer.get(
        EndPoints.getBranches,
        queryParameter: {
          "page": 1,
          "pageSize": 10,
        },
      );

      if (response.statusCode == 204) {
        List<PharmacyBranchModel> data = [];
        return Right(data);
      }

      List<dynamic> data = response.data["data"];
      return Right(
          data.map((json) => PharmacyBranchModel.fromJson(json)).toList());
    } catch (e) {
      return Left(ApiErrorHandler.handleError(e));
    }
  }
}
