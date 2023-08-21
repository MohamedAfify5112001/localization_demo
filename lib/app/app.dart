import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:projects_galaxy/bloc/locale_bloc/localization_bloc.dart';
import 'package:projects_galaxy/view/splash_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../l10n/l10n.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LocalizationBloc>(
      create: (context) => LocalizationBloc()..add(GetSavedLanguage()),
      child: BlocBuilder<LocalizationBloc, LocalizationState>(
        builder: (context, state) {
          log("Current Lang ${BlocProvider.of<LocalizationBloc>(context).locale}");
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            supportedLocales: L10n.englishAndArabic,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            locale: BlocProvider.of<LocalizationBloc>(context).locale,
            theme: ThemeData(
              appBarTheme: const AppBarTheme(color: Colors.teal),
              useMaterial3: true,
              scaffoldBackgroundColor: Colors.white,
            ),
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
