import 'package:flutter/material.dart';
import 'package:wallet/components/AppText.dart';

class SettingsListItem extends StatelessWidget {
  final VoidCallback? callback;
  final String label;
  final IconData? icon;
  final Widget? trailingWidget;
  final bool doPadding;
  const SettingsListItem({Key? key, this.callback, required this.label, this.icon, this.trailingWidget, this.doPadding = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(doPadding ? 10.0 : 0.0),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        onTap: callback,
        leading: Icon(icon ?? Icons.settings,),
        trailing: trailingWidget,
        title: AppText(text: label,),
      ),
    );
  }
}
