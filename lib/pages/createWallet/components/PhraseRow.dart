import 'package:flutter/material.dart';
import 'package:wallet/assets/SizeConfig.dart';
import 'package:wallet/components/Buttons/AppButton.dart';

class PhraseRow extends StatelessWidget {
  final String firstCol;
  final String secondCol;
  final String thirdCol;
  final String fourthCol;
  const PhraseRow({Key? key, required this.firstCol, required this.secondCol, required this.thirdCol, required this.fourthCol}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Padding(
      padding: SizeConfig.appEdgeInsets!,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AppButton(label: firstCol, callback: (){},),
          AppButton(label: secondCol, callback: (){},),
          AppButton(label: thirdCol, callback: (){},),
          AppButton(label: fourthCol, callback: (){},),
        ],
      ),
    );
  }
}
