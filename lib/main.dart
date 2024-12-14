import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/database/cache/cashe_helper.dart';
import 'package:pharmacy_app/core/global_cubits/change_language_cubit/change_language_cubit.dart';
import 'package:pharmacy_app/core/helpers/bloc_observer.dart';
import 'package:pharmacy_app/core/services/get_it.dart';
import 'package:pharmacy_app/pharmacy_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  setup();
  await getIt<CacheHelper>().init();
  runApp(BlocProvider(
    create: (context) => ChangeLanguageCubit(),
    child: const PharmacyApp(),
  ));
}
