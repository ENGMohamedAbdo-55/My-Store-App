import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../service/shared_pref/pref_keys.dart';
import '../../service/shared_pref/shared_pref.dart';

part 'app_state.dart';
part 'app_cubit.freezed.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState.initial());
  bool isDark = true;
  String currentLanguage = 'en';

  //! change app theme
  Future<void> changeAppThemeMode({bool? sharedMode}) async {
    if (sharedMode != null) {
      isDark = sharedMode;
      emit(AppState.themeChangeTheme(isDark: isDark));
    } else {
      isDark = !isDark;
      await SharedPref().setBoolean(PrefKeys.themeMode, isDark).then(
            (value) => emit(
              AppState.themeChangeTheme(isDark: isDark),
            ),
          );
    }
  }

//! change app language
  void getSavedLanguage({String? sharedLanguage}) {
    final result = SharedPref().containPreference(PrefKeys.language)
        ? SharedPref().getString(PrefKeys.language)
        : 'en';
    currentLanguage = result!;
    emit(AppState.languageChange(locale: Locale(currentLanguage)));
  }

  Future<void> _changeLang(String langCode) async {
    await SharedPref().setString(PrefKeys.language, langCode);
    currentLanguage = langCode;
    emit(AppState.languageChange(locale: Locale(currentLanguage)));
  }

  void toArabic() => _changeLang('ar');
  void toEnglish() => _changeLang('en');
}
