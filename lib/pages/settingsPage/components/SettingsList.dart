import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallet/pages/settingsPage/components/AppSettings.dart';
import 'package:wallet/pages/settingsPage/components/ChainSettings.dart';
import 'package:wallet/pages/settingsPage/components/SupportSettings.dart';

class SettingsList extends StatefulWidget {
  const SettingsList({Key? key}) : super(key: key);

  @override
  State<SettingsList> createState() => _SettingsListState();
}

class _SettingsListState extends State<SettingsList> {

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        AppSettings(),
        ChainSettings(),
        SupportSettings()
      ]
    );
  }
}
