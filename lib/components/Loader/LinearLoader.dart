import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:wallet/assets/Colors.dart';

class LinearLoader extends StatelessWidget {
  const LinearLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpinKitDoubleBounce(
      color: ThemeProvider.themeOf(context).id == "dark" ? Colors.white : colorApp,
    );
  }
}
