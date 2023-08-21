import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:projects_galaxy/app/app.dart';
import 'package:projects_galaxy/bloc/locale_bloc/localization_bloc.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context)!.helloWorld,
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    color: Colors.black,
                  ),
            ),
            const SizedBox(
              height: 40,
            ),
            BlocBuilder<LocalizationBloc, LocalizationState>(
              builder: (context, state) {
                return Column(
                  children: [
                    RadioListTile<Locale>(
                      title: const Text('English'),
                      value: const Locale('en'),
                      groupValue:
                          BlocProvider.of<LocalizationBloc>(context).locale,
                      onChanged: (locale) {
                        BlocProvider.of<LocalizationBloc>(context)
                            .add(ChangeAppLanguage(locale: locale!));
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) => MyApp()),
                            (route) => false);
                      },
                    ),
                    RadioListTile<Locale>(
                      title: const Text('Arabic'),
                      value: const Locale('ar'),
                      groupValue:
                          BlocProvider.of<LocalizationBloc>(context).locale,
                      onChanged: (locale) {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) => MyApp()),
                                (route) => false);
                        BlocProvider.of<LocalizationBloc>(context)
                            .add(ChangeAppLanguage(locale: locale!));

                      },
                    ),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }

  final List<LanguageLocale> languagesLocale = [
    LanguageLocale('English', const Locale('en')),
    LanguageLocale('Arabic', const Locale('ar'))
  ];

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        "Flutter Localization",
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Colors.white,
            ),
      ),
    );
  }
}

class LanguageLocale {
  final String text;
  final Locale locale;

  LanguageLocale(this.text, this.locale);
}
