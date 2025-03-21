import 'dart:developer';

import '../../../../core/database/api/end_points.dart';
import '../../../../core/database/cache/cashe_helper.dart';
import '../../../../core/database/cache/secure_storage.dart';
import '../../../../core/services/get_it.dart';
import '../data/pharmacy_branch_model.dart';
import 'get_branches_repo.dart';
import 'package:pharmacy_app/core/database/api/api_consumer.dart';

class GetBranchesRepoImpl implements GetBranchesRepo {
  final ApiConsumer apiConsumer;

  GetBranchesRepoImpl(this.apiConsumer);

  @override
  Future<List<PharmacyBranchModel>> getAllBranches() async {
    try {
      String? token = await SecureStorage.instance.getData(key: ApiKeys.token);
      if (token == null) {
        throw Exception("Authentication token not found");
      }

      String lang = getIt<CacheHelper>().getCurrentLanguage();

      final response = await apiConsumer.get(
        EndPoints.getBranches,
        queryParameter: {
          "page": 1,
          "pageSize": 10,
        },
        headers: {
          'Authorization': 'Bearer $token',
          'lang': lang,
        },
      );

      List<dynamic> data = response.data["data"];
      return data.map((json) => PharmacyBranchModel.fromJson(json)).toList();
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to fetch pharmacies: $e');
    }
  }
}
