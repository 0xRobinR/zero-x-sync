import 'package:flutter/material.dart';
import 'package:wallet/components/AppText.dart';

class LinkButton extends StatelessWidget {
  final VoidCallback? callback;
  final bool withIcon;
  final String text;
  final IconData? iconData;

  const LinkButton({
    Key? key,
    required this.text,
    this.callback,
    this.withIcon = false,
    this.iconData
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return withIcon ? IconButton(
        onPressed: callback, icon: Icon(iconData)
    )
    : ElevatedButton(
        onPressed: callback,
        child: AppText(text: text)
    );
  }
}
