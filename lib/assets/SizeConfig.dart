import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? defaultSize;
  static double? statusBar;
  static double? appPadding;
  static double? appBigText;
  static double? appText;
  static Orientation? orientation;
  static EdgeInsetsGeometry? appEdgeInsets;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData?.size.width;
    screenHeight = _mediaQueryData?.size.height;
    orientation = _mediaQueryData?.orientation;
    statusBar = _mediaQueryData?.padding.top;
    appPadding = 16.0;
    appBigText = 25.0;
    appText = 13.0;

    defaultSize = orientation == Orientation.landscape
        ? screenHeight! * 0.024
        : screenWidth! * 0.024;

    appEdgeInsets = EdgeInsets.all(appPadding!);
  }
}

const double appBorder = 15.0;