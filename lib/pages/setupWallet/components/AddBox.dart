import 'package:flutter/material.dart';
import 'package:wallet/assets/Colors.dart';
import 'package:wallet/assets/SizeConfig.dart';
import 'package:wallet/components/AppText.dart';

class AddBox extends StatelessWidget {
  final String label;
  final VoidCallback callback;
  final IconData iconData;

  const AddBox({
    Key? key,
    required this.label,
    required this.callback,
    required this.iconData
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Container(
      width: SizeConfig.screenWidth! / 2,
      height: SizeConfig.screenWidth! / 2,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(25.0)),
        color: colorApp.shade600,
      ),
      child: InkWell(
        onTap: callback,
        borderRadius: const BorderRadius.all(Radius.circular(25.0)),
        splashColor: colorApp.shade900,
        focusColor: colorApp.shade100,
        highlightColor: colorApp.shade400,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(
            iconData,
            size: SizeConfig.appBigText! * 2,
            color: Colors.white,
          ),
          AppText(
            text: label,
            fontSize: SizeConfig.appBigText!,
            color: Colors.white,
          )
        ]),
      ),
    );
  }
}
