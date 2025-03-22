import 'package:dartz/dartz.dart';
import 'package:pharmacy_app/core/database/api/api_consumer.dart';
import 'package:pharmacy_app/features/medicine_details/data/models/delete_response_model.dart';
import 'package:pharmacy_app/features/medicine_details/data/repos/delete_repo.dart';

import '../../../../core/database/api/end_points.dart';
import '../../../../core/database/cache/cashe_helper.dart';
import '../../../../core/database/cache/secure_storage.dart';
import '../../../../core/services/get_it.dart';

class DeleteRepoImpl implements DeleteRepo {
  final ApiConsumer apiConsumer;

  DeleteRepoImpl({required this.apiConsumer});
  @override
  Future<Either<String, String>> deleteMedicine({
    required String branchId,
    required String id,
  }) async {
    try {
      String? token = await SecureStorage.instance.getData(key: ApiKeys.token);
      if (token == null) throw Exception("Authentication token not found");
      String lang = getIt.get<CacheHelper>().getCurrentLanguage();
      final response = await apiConsumer.delete(
        '${'api/secure/Product/'}$branchId/$id',
        headers: {
          ApiKeys.token: token,
          'lang': lang,
        },
      );
      final data = DeleteResponseModel.fromJson(response.data);
      return Right(data.message);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
