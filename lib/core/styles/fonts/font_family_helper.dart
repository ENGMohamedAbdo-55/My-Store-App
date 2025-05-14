import '../../service/shared_pref/pref_keys.dart';
import '../../service/shared_pref/shared_pref.dart';

class FontFamilyHelper {
  const FontFamilyHelper._();

  static const String cairoArabic = 'Cairo';
  static const String poppinsEnglish = 'Poppins';
  static String getLocalFontFamily() {
    final currentLanguage = SharedPref().getString(PrefKeys.language);

    if (currentLanguage == 'ar') {
      return cairoArabic;
    } else {
      return poppinsEnglish;
    }
  }
}
