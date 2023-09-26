import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:wallet/assets/Colors.dart';
import 'package:wallet/assets/SizeConfig.dart';
import 'package:wallet/components/AppText.dart';
import 'package:wallet/components/Buttons/AppIconButton.dart';
import 'package:wallet/config/index.dart';
import 'package:wallet/hooks/useLocalStorage.dart';
import 'package:wallet/hooks/useSteps.dart';
import 'package:wallet/lib/providers/AuthenticationProvider.dart';
import 'package:wallet/pages/HelperClass.dart';
import 'package:wallet/theme/spacing.dart';
import 'package:wallet/utils/devLogger.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with HelperClass {

  bool isLoaded = false;
  bool isError = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initApp();
  }

  initApp() async {
    setState(() {
      isLoaded = false;
    });

    String currentRoute = await getLastStep();
    final getAuth = await getFromStorage(key: appAuthChannel);

    logD(title: currentRoute);

    if ( getAuth != null ) {
      bool auth = await AuthenticationProvider.authenticateWithBiometrics(context: context);
      if ( auth ) {
        Navigator.of(context).pushReplacementNamed(currentRoute);
        return;
      } else {
        showToast(context, "$appName: auth not succeeded");
        setState(() {
          isLoaded = true;
          isError = true;
        });
        return;
      }
    } else {
      Timer(const Duration(milliseconds: 2500), () {
        Navigator.of(context).pushReplacementNamed(currentRoute);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: ThemeProvider.themeOf(context).id == "dark" ? Colors.white : colorApp,
                width: 10
              )
            ),
            width: double.infinity,
            height: SizeConfig.screenHeight! / 3,
          ),
          const VerticalSpacing(of: 15.0),
          if( !isLoaded ) SizedBox(
              width: 30.0,
              height: 30.0,
              child: SpinKitSpinningLines(color: ThemeProvider.themeOf(context).id == "dark" ? Colors.white : Colors.black)
          ),
          const VerticalSpacing(of: 15.0),
          const AppText(
            text: appName,
            fontSize: 25.0,
          ),
          const AppText(
            text: appTagLine,
          ),
          if ( isError )
            const VerticalSpacing(of: 15.0),
          if ( isError )
            AppIconButton(
              icon: Icons.refresh,
              label: "reauth",
              withLabel: true,
              callback: initApp,
            )
        ],
      ),
    );
  }
}
