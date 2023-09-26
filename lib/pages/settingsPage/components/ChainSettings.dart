import 'package:flutter/material.dart';
import 'package:wallet/assets/Colors.dart';
import 'package:wallet/components/AppText.dart';
import 'package:wallet/locale/locales.dart';
import 'package:wallet/pages/settingsPage/components/SettingsListItem.dart';
import 'package:wallet/pages/settingsPage/components/SwitchListItem.dart';
import 'package:wallet/theme/spacing.dart';

class ChainSettings extends StatefulWidget {
  const ChainSettings({Key? key}) : super(key: key);

  @override
  State<ChainSettings> createState() => _ChainSettingsState();
}

class _ChainSettingsState extends State<ChainSettings> {

  bool enableDapp = true;
  bool customNode = false;

  changeDapp(val) {
    setState(() {
      enableDapp = val;
    });
  }

  changeNode() {
    setState(() {
      customNode = !customNode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      // shadowColor: colorApp,
      // color: Colors.transparent,
      borderOnForeground: true,
      child: Column(
        children: [
          const VerticalSpacing(of: 10.0),
          const AppText(text: "chain settings"),
          SettingsListItem(
            label: "all chains",
            icon: Icons.list_alt_rounded,
            callback: () {},
            trailingWidget: const Icon(Icons.arrow_right, color: Colors.white,),
          ),
          SettingsListItem(
            label: "add chain / network",
            icon: Icons.add,
            callback: () {},
          ),
          SettingsListItem(
            label: "custom node",
            icon: Icons.alt_route_rounded,
            callback: changeNode,
            trailingWidget: Icon(
              Icons.circle,
              color: customNode ? Colors.green.shade200 : Colors.red.shade200,
            ),
          ),
          SwitchListItem(
            label: "dapp ${enableDapp ? "enabled" : "disabled"}",
            onIcon: Icons.search_rounded,
            offIcon: Icons.search_off_rounded,
            value: enableDapp,
            change: changeDapp,
          ),
        ]
      )
    );
  }
}
