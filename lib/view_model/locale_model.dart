import 'package:flutter/material.dart';
import 'package:flutter_ok/config/storage_manager.dart';

class LocaleModel extends ChangeNotifier {
  static const localeValueList = ['zh', 'en',"ms"];

  //
  static const kLocaleIndex = 'kLocaleIndex';

  int _localeIndex = getStorage(kLocaleIndex) ?? 0;

  int get localeIndex => _localeIndex;

  Locale get locale {
      var value = localeValueList[_localeIndex].split("-");
      return Locale(value[0], value.length == 2 ? value[1] : '');
  }

  switchLocale(int index) {
    _localeIndex = index;
    notifyListeners();
    setStorage(kLocaleIndex, index);
  }

  static String localeName(index, context) {
    switch (index) {
      case 0:
        return '中文';
      case 1:
        return 'English';
      case 2:
        return 'Malay';
      default:
        return '';
    }
  }
}
