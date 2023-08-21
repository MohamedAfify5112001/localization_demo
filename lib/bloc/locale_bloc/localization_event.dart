part of 'localization_bloc.dart';

@immutable
abstract class LocalizationEvent {}

final class ChangeAppLanguage extends LocalizationEvent {
  final Locale locale;

  ChangeAppLanguage({required this.locale});
}

final class GetSavedLanguage extends LocalizationEvent {
  GetSavedLanguage();
}
