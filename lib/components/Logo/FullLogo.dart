import 'package:wallet/config/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

const String fullLogoAsset = "assets/Logo.svg";
Widget fullLogo = SvgPicture.asset(
    fullLogoAsset,
    semanticsLabel: appName
);