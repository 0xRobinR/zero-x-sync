import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:local_auth/error_codes.dart' as auth_error;
import 'package:local_auth/local_auth.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:wallet/assets/Colors.dart';
import 'package:wallet/components/AppText.dart';
import 'package:wallet/config/index.dart';
import 'package:wallet/hooks/useLocalStorage.dart';
import 'package:wallet/lib/providers/AuthenticationProvider.dart';
import 'package:wallet/pages/HelperClass.dart';
import 'package:wallet/pages/settingsPage/components/LanguageSelector.dart';
import 'package:wallet/pages/settingsPage/components/SettingsListItem.dart';
import 'package:wallet/pages/settingsPage/components/SwitchListItem.dart';
import 'package:wallet/theme/spacing.dart';
import 'package:wallet/utils/devLogger.dart';

class AppSettings extends StatefulWidget {
  const AppSettings({Key? key}) : super(key: key);

  @override
  State<AppSettings> createState() => _AppSettingsState();
}

class _AppSettingsState extends State<AppSettings> with HelperClass {

  bool isDarkMode = true;
  bool is0xSyncMode = false;
  bool isAppLockActive = false;
  bool isLocalAuthAvailable = false;

  final LocalAuthentication auth = LocalAuthentication();

  @override
  initState() {
    super.initState();

    initSettings();
  }

  initSettings() async {
    final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
    final bool canAuthenticate = canAuthenticateWithBiometrics || await auth.isDeviceSupported();

    final List<BiometricType> availableBiometrics = await auth.getAvailableBiometrics();

    if (availableBiometrics.isNotEmpty) {
      setState(() {
        isLocalAuthAvailable = false;
      });
    }

    logD(title: "Available: $canAuthenticate");

    if (availableBiometrics.contains(BiometricType.strong)
      || availableBiometrics.contains(BiometricType.face)
      || availableBiometrics.contains(BiometricType.fingerprint)
    ) {
      setState(() {
        isLocalAuthAvailable = canAuthenticate;
      });
    }

    final isSavedAppLock = await getFromStorage(key: appAuthChannel);
    if ( isSavedAppLock != null ) {
      setState(() {
        isAppLockActive = true;
      });
    } else {
      setState(() {
        isAppLockActive = false;
      });
    }

    final isDarkOn = ThemeProvider.controllerOf(context).currentThemeId;
    setState(() {
      isDarkMode = isDarkOn == "dark";
    });
  }

  changeAppLockSettings(val) async {
    if ( isLocalAuthAvailable && val ) {
      try {
        final bool didAuthenticate = await AuthenticationProvider.authenticateWithBiometrics(context: context);
        logD(title: "Authenticate: $didAuthenticate");

        if ( didAuthenticate ) {
          saveToStorage(key: appAuthChannel, value: "true");
          showToast(context, "success: saved app lock");
          setState(() {
            isAppLockActive = true;
          });
        } else {
          showToast(context, "error: no auth received");
        }
      } on PlatformException catch (e) {

        switch(e.code) {
          case auth_error.notEnrolled:
            showToast(context, "error: no auth enrolled");
            break;
          case auth_error.biometricOnlyNotSupported:
            showToast(context, "error: no biometric available");
            break;
          case auth_error.lockedOut:
            showToast(context, "error: auth is locked, try again later");
            break;
          case auth_error.notAvailable:
            showToast(context, "error: auth is not available");
            break;
        }
      }
    }
    if ( !val ) {
      await removeFromStorage(key: appAuthChannel);
      showToast(context, "success: disabled app lock");
      setState(() {
        isAppLockActive = false;
      });
    }
  }

  changeDarkMode(val) {
    setState(() {
      isDarkMode = val;
    });
  }

  change0xSyncMode(val) {
    setState(() {
      is0xSyncMode = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      shadowColor: Colors.white12,
      color: Colors.transparent,
      borderOnForeground: true,
      child: Column(
        children: [
          const VerticalSpacing(of: 10.0),
          const AppText(text: "app settings"),
          SettingsListItem(
            label: "theme: ${isDarkMode ? "dark" : "light" }",
            icon: FontAwesomeIcons.lightbulb,
            callback: () {
              ThemeProvider.controllerOf(context).setTheme(!isDarkMode ? "dark" : "light");
              logD(title: ThemeProvider.controllerOf(context).currentThemeId);
              changeDarkMode(!isDarkMode);
            },
            trailingWidget: Icon(
              !isDarkMode ? Icons.nightlight_round : Icons.wb_sunny_rounded,
              // color: !isDarkMode ? Colors.white : Colors.yellow.shade200,
            ),
          ),

          SwitchListItem(
            label: "0xSync ${is0xSyncMode ? "enabled" : "disabled" }",
            onIcon: FontAwesomeIcons.lock,
            offIcon: FontAwesomeIcons.unlock,
            change: change0xSyncMode,
            value: is0xSyncMode,
          ),

          if( isLocalAuthAvailable ) SwitchListItem(
            label: "app lock",
            onIcon: FontAwesomeIcons.fingerprint,
            offIcon: FontAwesomeIcons.fingerprint,
            change: changeAppLockSettings,
            value: isAppLockActive,
          ),

          const SettingsListItem(
            icon: Icons.notifications,
            label: "notifications"
          ),

          const LanguageSelector()
        ],
      ),
    );
  }
}
