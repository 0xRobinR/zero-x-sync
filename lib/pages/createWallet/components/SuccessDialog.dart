import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallet/assets/Assets.dart';
import 'package:wallet/assets/SizeConfig.dart';
import 'package:wallet/components/AppText.dart';
import 'package:wallet/components/Buttons/AppButton.dart';
import 'package:wallet/config/index.dart';
import 'package:wallet/generated/codegen_loader.g.dart';

class SuccessDialog extends StatelessWidget {
  final String walletName;
  const SuccessDialog({Key? key, required this.walletName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return AlertDialog(
      title: AppText(text: tr(LocaleKeys.wallet_created, namedArgs: { 'chain': walletName }), color: Colors.black),
      content: Container(
        color: Colors.white,
        padding: SizeConfig.appEdgeInsets,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(walletCreateAsset),
            const SizedBox(height: 10.0,),
            AppText(
              text: tr(LocaleKeys.wallet_created_description),
              color: Colors.black,
            ),
            const SizedBox(height: 10.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppButton(
                  label: tr(LocaleKeys.backup_wallet),
                  callback: () {
                    Navigator.of(context).pop();
                  },
                ),
                // AppButton(
                //   label: tr(LocaleKeys.later),
                //   callback: () {
                //     Navigator.of(context).pop();
                //     Navigator.of(context).pushReplacementNamed(appWalletRoute);
                //   },
                // ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
