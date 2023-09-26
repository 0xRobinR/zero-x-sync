
import 'package:provider/single_child_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<List<SingleChildWidget>> createProviders() async {
  final preferences = await SharedPreferences.getInstance();

  return [];
}