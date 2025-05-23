part of 'app_cubit.dart';

@freezed
class AppState with _$AppState {
  const factory AppState.initial() = _Initial;
  const factory AppState.themeChangeTheme({required bool isDark}) = ThemechangeModeState;
  const factory AppState.languageChange({required Locale locale}) = LanguagechangeState;
}
