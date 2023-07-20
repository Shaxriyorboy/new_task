import 'package:flutter/material.dart';
import 'package:l/l.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum LangCodes { uz, ru , en }

final localController = LocalController();

// ignore: prefer_mixin
class LocalController with ChangeNotifier {
  LocalController() : _appLocal = 'uz' {
    SharedPreferences.getInstance().then<void>(
      (sp) {
        final appLocal = sp.getString("language");
        if (appLocal != null && appLocal.isNotEmpty) {
          _appLocal = appLocal;
          notifyListeners();
        }
      },
      onError: l.w,
    );
  }

  Locale get appLocal => _appLocal == 'uz' ? const Locale('uz', 'UZ') : _appLocal == 'en' ? const Locale('en', 'EN') : const Locale('ru', 'RU');

  String _appLocal;

  void changeLocal(LangCodes langCode) {
    _appLocal = langCode.name;

    SharedPreferences.getInstance().then<void>(
      (sp) {
        sp.setString("language", _appLocal);
      },
      onError: l.w,
    );
    notifyListeners();
  }
}
