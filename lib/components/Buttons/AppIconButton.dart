import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:wallet/components/AppText.dart';

class AppIconButton extends StatelessWidget {
  final IconData icon;
  final bool withLabel;
  final String label;
  final VoidCallback? callback;
  final Color? color;
  const AppIconButton({Key? key, required this.icon, this.label = "", this.callback, this.withLabel = false, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return withLabel
      ? ElevatedButton.icon(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(2.0),
          backgroundColor: MaterialStateProperty.all<Color?>(color),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
              side: BorderSide(
                color: ThemeProvider.themeOf(context).id == "dark" ? Colors.white60: Colors.black54
              )
            )
          )
        ),
        onPressed: callback,
        icon: Icon(icon),
        label: AppText(text: label,),
      )
      : IconButton(
        onPressed: callback,
        icon: Icon(
          icon,
        ),
      )
    ;
  }
}
