import 'package:flutter/material.dart';
import 'package:wallet/assets/Colors.dart';
import 'package:wallet/components/AppText.dart';

class AppButton extends StatelessWidget {
  final VoidCallback? callback;
  final String label;
  Color? color;
  Color? textColor;
  AppButton({Key? key, this.callback, required this.label, this.color, this.textColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callback,
      style: ElevatedButton.styleFrom(
        shadowColor: colorApp.shade800,
        primary: color ?? Colors.grey[800]
      ),
      child: AppText(text: label, color: textColor,)
    );
  }
}
