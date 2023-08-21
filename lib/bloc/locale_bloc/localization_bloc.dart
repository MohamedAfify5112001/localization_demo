import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:projects_galaxy/helper/cache_helper.dart';
import 'package:projects_galaxy/l10n/l10n.dart';

part 'localization_event.dart';

part 'localization_state.dart';

class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  Locale locale = const Locale('en');

  LocalizationBloc() : super(LocalizationInitial()) {
    on<ChangeAppLanguage>(_toEnglishOrArabic);
    on<GetSavedLanguage>(_onGetSavedLang);
  }

  Future<void> _toEnglishOrArabic(
      ChangeAppLanguage event, Emitter<LocalizationState> emit) async {
    if (!L10n.englishAndArabic.contains(event.locale)) return;
    locale = event.locale;
    log("Current Event Choose $locale");
    await LocalStorage.storeStringValue(
        key: 'current', value: event.locale.languageCode);
    emit(SelectedLanguageLocalization(event.locale));
  }

  Future<void> _onGetSavedLang(
      GetSavedLanguage event, Emitter<LocalizationState> emit) async {
    String lang = await LocalStorage.getStringValue(key: 'current');
    lang = lang.isNotEmpty ? lang : 'en';
    locale = Locale(lang);
    emit(SelectedLanguageLocalization(Locale(lang)));
  }
}
