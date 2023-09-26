import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wallet/assets/Colors.dart';
import 'package:wallet/components/AppText.dart';
import 'package:wallet/components/Buttons/AppIconButton.dart';
import 'package:wallet/generated/codegen_loader.g.dart';
import 'package:wallet/theme/spacing.dart';

class Header extends StatelessWidget {
  final String text;
  final bool isAction;
  const Header({Key? key, required this.text, this.isAction = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:10.0),
      child: Row(
        mainAxisAlignment: isAction ? MainAxisAlignment.spaceBetween : MainAxisAlignment.start,
        children: [
          AppText(text: text),

          if ( isAction )
            Row(
              children: [
                AppIconButton(
                  callback: (){},
                  icon: Icons.add,
                  label: tr(LocaleKeys.add_asset),
                  withLabel: true,
                ),
                const HorizontalSpacing(of: 5.0),
              ],
            )
        ],
      ),
    );
  }
}
