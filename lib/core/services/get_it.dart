
import 'package:get_it/get_it.dart';
import 'package:pharmacy_app/core/database/cache/cashe_helper.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<CacheHelper>(CacheHelper());


}
