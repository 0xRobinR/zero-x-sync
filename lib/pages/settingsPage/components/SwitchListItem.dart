import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:wallet/assets/Colors.dart';
import 'package:wallet/pages/settingsPage/components/SettingsListItem.dart';

class SwitchListItem extends StatelessWidget {
  final String label;
  final bool value;
  final Function(bool) change;
  final IconData? offIcon;
  final IconData? onIcon;
  const SwitchListItem({Key? key, required this.label, required this.value, required this.change, this.offIcon, this.onIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SettingsListItem(
      label: label,
      icon: value ? onIcon : offIcon,
      trailingWidget: CupertinoSwitch(
        thumbColor: value ? Colors.green.shade100 : Colors.grey,
        activeColor: ThemeProvider.themeOf(context).id == "dark" ? Colors.grey.shade900 : colorApp,
        onChanged: change,
        value: value,
      ),
      callback: () {
        change(!value);
      },
    );
  }
}
