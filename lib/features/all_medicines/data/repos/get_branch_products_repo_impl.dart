import 'package:dartz/dartz.dart';
import 'package:pharmacy_app/core/database/api/api_consumer.dart';
import 'package:pharmacy_app/core/database/api/api_error_handler.dart';
import 'package:pharmacy_app/core/database/api/api_error_model.dart';
import 'package:pharmacy_app/core/database/api/end_points.dart';
import 'package:pharmacy_app/core/database/cache/cashe_helper.dart';
import 'package:pharmacy_app/core/services/get_it.dart';
import 'package:pharmacy_app/features/all_medicines/data/models/get_branch_products_model.dart';

import 'get_branch_products_repo.dart';

class GetBranchProductsRepoImpl implements GetBranchProductsRepo {
  final ApiConsumer apiConsumer;

  GetBranchProductsRepoImpl({required this.apiConsumer});
  @override
  Future<Either<ApiErrorModel, GetBranchProductsModel>> getBranchProducts({
    required String branchId,
  }) async {
    try {
      final response = await apiConsumer.get(
        "${EndPoints.getBranchProducts}/$branchId",
        queryParameter: {
          "page": 1,
          "pageSize": 10,
        },
      );
      if (response.statusCode == 204) {
        return left(
          ApiErrorModel(
            message: getIt<CacheHelper>().getCurrentLanguage() == 'ar'
                ? 'لا يوجد أدوية في الفرع'
                : 'No Medicines in Branch',
          ),
        );
      }
      final data = GetBranchProductsModel.fromJson(response.data);
      return Right(data);
    } catch (e) {
      return Left(ApiErrorHandler.handleError(e));
    }
  }
}
