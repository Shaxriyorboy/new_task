import 'package:shared_preferences/shared_preferences.dart';

class AppStorage {

  void setToken(String token)async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("token", token);
  }

  Future<String> getToken()async{
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("token")??"";
  }

  Future<void> setFCMToken(String fcmToken)async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("fcmToken",fcmToken);
  }

  Future<String> getFCMToken()async{
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("fcmToken")??"";
  }

  Future<void> setLanguage(String language)async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("language", language);
  }

  Future<String> getLanguage()async{
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("language")??"en";
  }

  Future<bool> removeToken()async{
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove("token");
  }
}
