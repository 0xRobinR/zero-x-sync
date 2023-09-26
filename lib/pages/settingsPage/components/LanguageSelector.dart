import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:wallet/assets/Colors.dart';
import 'package:wallet/components/AppText.dart';
import 'package:wallet/components/Buttons/AppButton.dart';
import 'package:wallet/components/Loader/LinearLoader.dart';
import 'package:wallet/locale/locales.dart';
import 'package:wallet/main.dart';
import 'package:wallet/pages/settingsPage/components/SettingsListItem.dart';
import 'package:wallet/theme/spacing.dart';
import 'package:wallet/utils/devLogger.dart';

class LanguageSelector extends StatefulWidget {
  const LanguageSelector({Key? key}) : super(key: key);

  @override
  State<LanguageSelector> createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<LanguageSelector> {
  bool expandLanguage = false;
  bool isLoaded = false;
  late Widget currentWidget;

  @override
  initState() {
    super.initState();
  }

  initAppLanguage() {
    final language = languageList.firstWhere((element) => element.locale == context.locale);
    setState(() {
      currentWidget = CurrentLanguage(currentLocale: language.name, callback: switcher);
      isLoaded = true;
    });
  }

  switcher() {
    final language = languageList.firstWhere((element) => element.locale == context.locale);
    setState(() {
      currentWidget = LanguageList(currentLocale: language.name, callback: initAppLanguage,);
    });
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    initAppLanguage();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoaded) {
      return currentWidget;
    } else {
      return const LinearLoader();
    }
  }
}

class LanguageList extends StatefulWidget {
  final String currentLocale;
  final VoidCallback? callback;
  const LanguageList({Key? key, required this.currentLocale, this.callback}) : super(key: key);

  @override
  State<LanguageList> createState() => _LanguageListState();
}

class _LanguageListState extends State<LanguageList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(20.0)
      ),
      child: Column(
        children: [
          SettingsListItem(
            icon: Icons.translate_rounded,
            label: "language",
            doPadding: false,
            callback: widget.callback,
            trailingWidget: AppText(
                text: widget.currentLocale
            ),
          ),
          const VerticalSpacing(of: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ...languageList.map(
                (e) => InkWell(
                  onTap: () {
                    context.setLocale(e.locale);
                    widget.callback?.call();
                    RestartWidget.restartApp(context);
                  },
                  child: LanguageItem(
                    language: e.name,
                    isSelected: e.name == widget.currentLocale,
                  ),
                )
              )
            ],
          ),
          const VerticalSpacing(of: 10.0),
        ],
      ),
    );
  }
}

class LanguageItem extends StatelessWidget {
  final String language;
  final bool isSelected;
  const LanguageItem({Key? key, required this.language, required this.isSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: isSelected ? (ThemeProvider.themeOf(context).id == "dark" ? colorApp.shade400 : Colors.grey.shade300) : Colors.white12,
        borderRadius: BorderRadius.circular(20.0)
      ),
      child: AppText(
        text: language,
      ),
    );
  }
}



class CurrentLanguage extends StatelessWidget {
  final VoidCallback? callback;
  final String currentLocale;
  const CurrentLanguage({Key? key, this.callback, required this.currentLocale}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SettingsListItem(
      icon: Icons.translate_rounded,
      label: "language",
      callback: callback,
      trailingWidget: AppText(
          text: currentLocale
      ),
    );
  }
}


