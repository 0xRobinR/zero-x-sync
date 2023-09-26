import 'dart:convert';
import 'package:wallet/config/index.dart';
import 'package:wallet/config/newSetup.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<String> getLastStep() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  String? appSetup = sharedPreferences.getString(appSteps);
  final appParsed = jsonDecode(appSetup ?? "{}");

  return appParsed['currentRoute'] ?? setupRoute;
}

Future<void> setLastStep({currentRoute}) async {
  final sharedPreferences = await SharedPreferences.getInstance();
  await sharedPreferences.setString(appSteps, jsonEncode({'currentRoute': currentRoute}));
}

Future<void> resetApp() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  await sharedPreferences.clear();
}