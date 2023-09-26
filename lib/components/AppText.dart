import 'package:flutter/cupertino.dart';
import 'package:wallet/assets/Styles.dart';
import 'package:auto_size_text/auto_size_text.dart';

class AppText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final TextStyle? style;
  final TextAlign? textAlign;

  const AppText({
    Key? key,
    required this.text,
    this.color,
    this.fontSize,
    this.style,
    this.textAlign
  }) : super(key: key);

  @override
  Widget build(BuildContext context)  {
    return Text(
      text,
      style: appTextStyle(
        color: color,
        fontSize: fontSize
      ).merge(style),
      textAlign: textAlign,
      softWrap: true,
      maxLines: 3,
    );
  }

}