import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Map<int, Color> colorMap = {
  50: const Color.fromRGBO(0, 0, 0, .1),
  100: const Color.fromRGBO(0, 0, 0, .2),
  200: const Color.fromRGBO(0, 0, 0, .3),
  300: const Color.fromRGBO(0, 0, 0, .4),
  400: const Color.fromRGBO(0, 0, 0, .5),
  500: const Color.fromRGBO(0, 0, 0, .6),
  600: const Color.fromRGBO(0, 0, 0, .7),
  700: const Color.fromRGBO(0, 0, 0, .8),
  800: const Color.fromRGBO(0, 0, 0, .9),
  900: const Color.fromRGBO(0, 0, 0, 1)
};

MaterialColor colorApp = MaterialColor(0xFF000000, colorMap);

Color colorText = Colors.white;
Color phraseColor = Colors.grey.shade200;
Color copyColor = Colors.green.shade200;