import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/database/cache/cashe_helper.dart';
import 'package:pharmacy_app/core/global_cubits/change_language_cubit/change_language_state.dart';
import 'package:pharmacy_app/core/services/get_it.dart';

class ChangeLanguageCubit extends Cubit<ChangeLanguageState> {
  ChangeLanguageCubit() : super(ChangeLanguageInitial());
  static ChangeLanguageCubit get(context) => BlocProvider.of(context);
  String arabic = 'ar';
  String english = 'en';
  void changeLanguage({required String language})async {
   await getIt<CacheHelper>().setCurrentLanguage(language: language);
    emit(ChangeLanguageDone());
  }


  
}
