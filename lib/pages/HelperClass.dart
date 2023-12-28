import 'package:flutter/material.dart';
import 'package:wallet/components/AppText.dart';

class HelperClass {
  static showToast(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: AppText(
          text: message,
        )
      )
    );
  }

  static showToastWithoutState(context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: AppText(
          text: message,
        )
      )
    );
  }
}