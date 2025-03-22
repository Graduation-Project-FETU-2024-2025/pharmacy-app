import 'package:dartz/dartz.dart';
import 'package:pharmacy_app/core/database/api/api_consumer.dart';
import 'package:pharmacy_app/core/database/api/end_points.dart';
import 'package:pharmacy_app/core/database/cache/cashe_helper.dart';
import 'package:pharmacy_app/core/database/cache/secure_storage.dart';
import 'package:pharmacy_app/core/services/get_it.dart';
import 'package:pharmacy_app/features/all_medicines/data/models/get_branch_products_model.dart';

import 'get_branch_products_repo.dart';

class GetBranchProductsRepoImpl implements GetBranchProductsRepo {
  final ApiConsumer apiConsumer;

  GetBranchProductsRepoImpl({required this.apiConsumer});
  @override
  Future<Either<String, GetBranchProductsModel>> getBranchProducts({
    required String branchId,
  }) async {
    try {
      String? token = await SecureStorage.instance.getData(key: ApiKeys.token);
      if (token == null) throw Exception("Authentication token not found");
      String lang = getIt.get<CacheHelper>().getCurrentLanguage();
      final response = await apiConsumer.get(
        "${EndPoints.getBranchProducts}/$branchId",
        headers: {
          ApiKeys.token: token,
          ApiKeys.lang: lang,
        },
        queryParameter: {
          "page": 1,
          "pageSize": 10,
        },
      );
      final data = GetBranchProductsModel.fromJson(response.data);
      return Right(data);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
