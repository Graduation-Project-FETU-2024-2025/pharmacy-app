import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/core/routers/app_routers.dart';
import 'package:pharmacy_app/core/routers/routing.dart';
import 'package:pharmacy_app/core/theme/app_theme.dart';
import 'package:pharmacy_app/generated/l10n.dart';

class PharmacyApp extends StatelessWidget {
  const PharmacyApp({super.key});

  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          locale: const Locale('en'),
          initialRoute: Routing.onboarding,
          theme: Themes.lightTheme,
          darkTheme: Themes.darkTheme,
          // themeMode: ThemeSwitchingCubit.get(context).theme,
          onGenerateRoute: AppRouters().generateRoute,
        );
      },
    );
  }
}
