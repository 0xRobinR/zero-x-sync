import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:wallet/components/AppText.dart';
import 'package:wallet/config/index.dart';
import 'package:wallet/pages/settingsPage/components/SettingsListItem.dart';
import 'package:wallet/theme/spacing.dart';

class SupportSettings extends StatefulWidget {
  const SupportSettings({Key? key}) : super(key: key);

  @override
  State<SupportSettings> createState() => _SupportSettingsState();
}

class _SupportSettingsState extends State<SupportSettings> {
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
          const AppText(text: "support"),
          SettingsListItem(
            label: "help center",
            icon: FontAwesomeIcons.circle,
            callback: () {
              launchUrlString(
                appUrl,
                mode: LaunchMode.externalApplication
              );
            },
          ),
          SettingsListItem(
            label: "discord",
            icon: FontAwesomeIcons.discord,
            callback: () {
              launchUrlString(
                discord,
                mode: LaunchMode.externalApplication
              );
            },
          ),
          SettingsListItem(
            label: "medium",
            icon: FontAwesomeIcons.medium,
            callback: () {
              launchUrlString(
                medium,
                mode: LaunchMode.externalApplication
              );
            },
          ),
          SettingsListItem(
            label: "telegram",
            icon: FontAwesomeIcons.telegram,
            callback: () {
              launchUrlString(
                telegram,
                mode: LaunchMode.externalApplication
              );
            },
          ),
          SettingsListItem(
            label: "reddit",
            icon: FontAwesomeIcons.redditAlien,
            callback: () {
              launchUrlString(
                reddit,
                mode: LaunchMode.externalApplication
              );
            },
          )
        ],
      )
    );
  }
}
