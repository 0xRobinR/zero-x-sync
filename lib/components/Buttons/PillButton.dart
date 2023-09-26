import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:wallet/assets/Colors.dart';
import 'package:wallet/assets/SizeConfig.dart';
import 'package:wallet/components/AppText.dart';

class PillButton extends StatelessWidget {
  final VoidCallback? callback;
  final bool withIcon;
  final String text;
  final Color? textColor;
  final Color? backColor;
  final IconData? iconData;

  const PillButton({
    Key? key,
    required this.text,
    this.callback,
    this.withIcon = false,
    this.iconData,
    this.backColor,
    this.textColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(appBorder)),
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: Colors.white,
            )
          ),
          withIcon ? TextButton.icon(
            onPressed: callback,
            icon: Icon(iconData),
            label: AppText(text: text),
          ): TextButton(
            onPressed: callback,
            child: AppText(
              text: text,
              color: Colors.black
            ),
          ),
        ]
      ),
    );
  }
}
