import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wallet/config/index.dart';
import 'package:wallet/pages/404.dart';
import 'package:wallet/pages/appWallet/index.dart';
import 'package:wallet/pages/createWallet/index.dart';
import 'package:wallet/pages/legalConditions/index.dart';
import 'package:wallet/pages/setupWallet/index.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:wallet/pages/splashScreen/SplashScreen.dart';

PageRoute generateRoute({ appSettings }){
  switch(appSettings.name) {
    case '/':
      return MaterialWithModalsPageRoute(builder: (builder) => const SetupWallet());
    case legalRoute:
      return MaterialWithModalsPageRoute(builder: (builder) => const LegalConditions());
    case setupRoute:
      return MaterialWithModalsPageRoute(builder: (builder) => const SetupWallet());
    case walletCreatedRoute:
      return MaterialPageRoute(builder: (builder) => CreateWallet(chain: appSettings.arguments));
    case appWalletRoute:
      return MaterialPageRoute(builder: (builder) => const AppWallet());
    case splashRoute:
      return MaterialPageRoute(builder: (builder) => const SplashScreen());
    default:
      return MaterialPageRoute(builder: (builder) => const Error404());
  }
}