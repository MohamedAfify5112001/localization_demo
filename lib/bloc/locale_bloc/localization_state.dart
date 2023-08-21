part of 'localization_bloc.dart';

@immutable
abstract class LocalizationState {}

class LocalizationInitial extends LocalizationState {}

class SelectedLanguageLocalization extends LocalizationState {
  final Locale _locale;

  SelectedLanguageLocalization(this._locale);

  Locale get locale => _locale;
}
