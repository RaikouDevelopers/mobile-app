

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum _Key {
  lang
}

class LocalStorageService extends GetxService {

  //true the local language will not be set in landing binder it will be used from the user choice durin g strt off the application
  //false the local will be set in landing binder by fetching it from the shared pref
  var isFirstTimeSetUp=false;

  SharedPreferences? _sharedPreferences;

//on launch of application set up shared pref instance
  Future<LocalStorageService> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }

  /// isLoggedIn
  set isLoggedIn(bool value) {
    _sharedPreferences?.setBool('isLoggedIn', value);
  }

  bool get isLoggedIn => _sharedPreferences?.getBool('isLoggedIn') ?? false;

  ///Get user previous preferred language.
  String? get getLanguage {
    final language = _sharedPreferences?.getString(
      _Key.lang.toString(),
    );
    if (language == null) {
      return "en_US";
    }
    return language;
  }

  ///Set user preferred language.
  set setLanguage(String? value) {
    if (value != null) {
      _sharedPreferences?.setString(_Key.lang.toString(), value);
    } else {
      _sharedPreferences?.setString(_Key.lang.toString(), "en_US");
    }
  }


}

