import 'package:shared_preferences/shared_preferences.dart';

saveToStorage({required String key, required String value}) async {
  final sharedPreferences = await SharedPreferences.getInstance();
  await sharedPreferences.setString(key, value);
}

removeFromStorage({required String key}) async {
  final sharedPreferences = await SharedPreferences.getInstance();
  await sharedPreferences.remove(key);
}

Future<String?> getFromStorage({required String key}) async {
  final sharedPreferences = await SharedPreferences.getInstance();
  return sharedPreferences.getString(key);
}

