import 'dart:developer';
import 'package:pharmacy_app/core/database/api/api_consumer.dart';
import 'package:pharmacy_app/features/all_branches/data/data/pharmacy_branch_model.dart';
import '../../../../../core/database/api/end_points.dart';
import '../../../../../core/database/cache/cashe_helper.dart';
import '../../../../../core/database/cache/secure_storage.dart';
import '../../../../../core/services/get_it.dart';
import 'get_one_branch_repo.dart';

class GetOneBranchRepoImpl implements GetOneBranchRepo {
  final ApiConsumer apiConsumer;

  GetOneBranchRepoImpl(this.apiConsumer);

  @override
  Future<PharmacyBranchModel> getBranch(String branchId) async {
    try {
      String? token = await SecureStorage.instance.getData(key: ApiKeys.token);
      if (token == null) {
        throw Exception("Authentication token not found");
      }

      String lang = getIt<CacheHelper>().getCurrentLanguage();

      final response = await apiConsumer.get(
        '${EndPoints.getBranches}/$branchId', 
        headers: {
          'Authorization': 'Bearer $token',
          'lang': lang,
        },
      );

      if (response.data == null || response.data["data"] == null) {
        throw Exception("Invalid response from server");
      }

      return PharmacyBranchModel.fromJson(response.data["data"]);
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to fetch branch details: $e');
    }
  }
}
