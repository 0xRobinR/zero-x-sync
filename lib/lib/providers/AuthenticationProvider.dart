import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:wallet/config/index.dart';
import 'package:local_auth/error_codes.dart' as auth_error;
import 'package:wallet/pages/HelperClass.dart';
import 'package:wallet/pages/HelperClass.dart';
import 'package:wallet/pages/HelperClass.dart';
import 'package:wallet/pages/HelperClass.dart';

class AuthenticationProvider {
  static Future<bool> authenticateWithBiometrics({BuildContext? context}) async {
    final LocalAuthentication localAuthentication = LocalAuthentication();
    bool isBiometricSupported = await localAuthentication.isDeviceSupported();
    bool canCheckBiometrics = await localAuthentication.canCheckBiometrics;

    bool isAuthenticated = false;

    if (isBiometricSupported && canCheckBiometrics) {
      try {
        isAuthenticated = await localAuthentication.authenticate(
            localizedReason: 'authenticate to lock $appName',
            options: const AuthenticationOptions(
              useErrorDialogs: true,
            )
        );
      } on PlatformException catch(e) {
        if ( context != null ) {
          switch(e.code) {
            case auth_error.notEnrolled:
              HelperClass.showToastWithoutState(context, "error: no auth enrolled");
              break;
            case auth_error.biometricOnlyNotSupported:
              HelperClass.showToastWithoutState(context, "error: no biometric available");
              break;
            case auth_error.lockedOut:
              HelperClass.showToastWithoutState(context, "error: auth is locked, try again later");
              break;
            case auth_error.notAvailable:
              HelperClass.showToastWithoutState(context, "error: auth is not available");
              break;
          }
        }
      }
    }

    return isAuthenticated;
  }
}