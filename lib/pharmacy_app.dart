import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/core/database/cache/cache_keys.dart';
import 'package:pharmacy_app/core/database/cache/cashe_helper.dart';
import 'package:pharmacy_app/core/global_cubits/change_language_cubit/change_language_cubit.dart';
import 'package:pharmacy_app/core/global_cubits/change_language_cubit/change_language_state.dart';
import 'package:pharmacy_app/core/global_cubits/change_themes_cubit/change_themes_cubit.dart';
import 'package:pharmacy_app/core/routers/app_routers.dart';
import 'package:pharmacy_app/core/routers/routing.dart';
import 'package:pharmacy_app/core/services/get_it.dart';
import 'package:pharmacy_app/core/theme/app_theme.dart';
import 'package:pharmacy_app/generated/l10n.dart';

class PharmacyApp extends StatelessWidget {
  const PharmacyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      builder: (_, child) {
        return BlocBuilder<ChangeLanguageCubit, ChangeLanguageState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              locale: Locale(getIt<CacheHelper>()
                      .getString(key: CacheKeys.currentLanguage) ??
                  'en'),
              builder: (context, child) {
                final mediaQuery = MediaQuery.of(context);
                return MediaQuery(
                  data: mediaQuery.copyWith(
                    textScaler: TextScaler.linear(
                      1.0,
                    ),
                  ), 
                  child: child!,
                );
              },
              theme: Themes.lightTheme,
              darkTheme: Themes.darkTheme,
              themeMode: context.watch<ChangeThemesCubit>().isDarkMode
                  ? ThemeMode.dark
                  : ThemeMode.light,
              initialRoute: Routing.splash,
              onGenerateRoute: AppRouters().generateRoute,
            );
          },
        );
      },
    );
  }
}
