import 'package:get_it/get_it.dart';
import 'package:pharmacy_app/core/database/api/api_consumer.dart';
import 'package:pharmacy_app/core/database/api/dio_consumer.dart';
import 'package:pharmacy_app/core/database/api/dio_factory.dart';
import 'package:pharmacy_app/core/database/cache/cashe_helper.dart';
import 'package:pharmacy_app/features/add_medicine/data/repos/add_medicine_repo.dart';
import 'package:pharmacy_app/features/add_medicine/data/repos/add_medicine_repo_impl.dart';
import 'package:pharmacy_app/features/add_medicine/data/repos/get_system_medicines_repo.dart';
import 'package:pharmacy_app/features/add_medicine/data/repos/get_system_medicines_repo_impl.dart';
import 'package:pharmacy_app/features/all_branches/data/repo/get_branches_repo.dart';
import 'package:pharmacy_app/features/all_medicines/data/repos/get_branch_products_repo.dart';
import 'package:pharmacy_app/features/auth/data/repository/auth_repo.dart';
import 'package:pharmacy_app/features/auth/data/repository/auth_repo_impl.dart';
import 'package:pharmacy_app/features/medicine_details/data/repos/get_medicine_repo.dart';
import 'package:pharmacy_app/features/medicine_details/data/repos/get_medicine_repo_impl.dart';
import 'package:pharmacy_app/features/update_medicine/data/repos/update_medicine_repo.dart';
import 'package:pharmacy_app/features/update_medicine/data/repos/update_medicine_repo_impl.dart';
import 'package:pharmacy_app/features/home/data/repos/out_of_stock_repo.dart';
import 'package:pharmacy_app/features/home/data/repos/out_of_stock_repo_impl.dart';
import '../../features/pharmacy_details/data/repo/get_one_branch_repo.dart';
import '../../features/pharmacy_details/data/repo/get_one_branch_repo_impl.dart';
import '../../features/all_branches/data/repo/get_branches_repo_impl.dart';
import '../../features/all_medicines/data/repos/get_branch_products_repo_impl.dart';
import '../../features/medicine_details/data/repos/delete_repo.dart';
import '../../features/medicine_details/data/repos/delete_repo_impl.dart';
import '../../features/pharmacy_edit/data/repo/add_branch_repo.dart';
import '../../features/pharmacy_edit/data/repo/add_branch_repo_impl.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<CacheHelper>(CacheHelper());

  getIt.registerLazySingleton<ApiConsumer>(
    () => DioConsumer(
      dio: DioFactory.getDio(),
    ),
  );
  // auth repo

  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(getIt<ApiConsumer>()),
  );
  getIt.registerLazySingleton<GetOneBranchRepo>(
    () => GetOneBranchRepoImpl(getIt<ApiConsumer>()),
  );
  getIt.registerLazySingleton<GetBranchesRepo>(
    () => GetBranchesRepoImpl(getIt<ApiConsumer>()),
  );
  getIt.registerLazySingleton<GetBranchProductsRepo>(
    () => GetBranchProductsRepoImpl(apiConsumer: getIt<ApiConsumer>()),
  );

  getIt.registerLazySingleton<GetSystemMedicinesRepo>(
      () => GetSystemMedicinesRepoImpl(apiConsumer: getIt<ApiConsumer>()));

  getIt.registerLazySingleton<DeleteRepo>(
    () => DeleteRepoImpl(apiConsumer: getIt<ApiConsumer>()),
  );
  getIt.registerLazySingleton<AddMedicineRepo>(
    () => AddMedicineRepoImpl(apiConsumer: getIt<ApiConsumer>()),
  );
  getIt.registerLazySingleton<UpdateMedicineRepo>(
    () => UpdateMedicineRepoImpl(apiConsumer: getIt<ApiConsumer>()),
  );
  getIt.registerLazySingleton<GetMedicineRepo>(
      () => GetMedicineRepoImpl(apiConsumer: getIt<ApiConsumer>()));
  getIt.registerLazySingleton<OutOfStockRepo>(
    () => OutOfStockRepoImpl(apiConsumer: getIt<ApiConsumer>()),
  );
  getIt.registerLazySingleton<AddBranchRepo>(
    () => AddBranchRepoImpl(getIt<ApiConsumer>()),
  );
}
