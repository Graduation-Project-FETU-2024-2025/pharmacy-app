import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/global_cubits/change_themes_cubit/change_themes_state.dart';

class ChangeThemesCubit extends Cubit<ChangeThemesState> {
  ChangeThemesCubit() : super(ChangeThemesInitial());

  bool isDarkMode = false;

  void changeAppTheme() {
    isDarkMode = !isDarkMode;
    emit(ChangeThemesDone());
  }
}
