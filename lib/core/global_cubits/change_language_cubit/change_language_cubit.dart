import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/global_cubits/change_language_cubit/change_language_state.dart';

class ChangeLanguageCubit extends Cubit<ChangeLanguageState> {
  ChangeLanguageCubit() : super(ChangeLanguageInitial());
  static ChangeLanguageCubit get(context) => BlocProvider.of(context);

  bool isArabic = false;
  String currentLanguage = 'en';

  void changeLanguage({required String language}){
    
  }
}
