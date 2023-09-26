import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallet/assets/Colors.dart';

TextStyle appTextStyle({Color? color, double? fontSize}) {
  return GoogleFonts.roboto(
    textStyle: TextStyle(
      color: color,
      letterSpacing: 1.5,
      fontSize: fontSize
    )
  );
}