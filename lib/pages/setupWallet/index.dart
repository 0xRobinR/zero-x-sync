import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wallet/assets/Colors.dart';
import 'package:wallet/assets/SizeConfig.dart';
import 'package:wallet/components/AppText.dart';
import 'package:wallet/components/Chains/SelectChain.dart';
import 'package:wallet/components/Loader/LinearLoader.dart';
import 'package:wallet/config/index.dart';
import 'package:wallet/generated/codegen_loader.g.dart';
import 'package:wallet/hooks/useSteps.dart';
import 'package:wallet/pages/setupWallet/components/AddBox.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class SetupWallet extends StatefulWidget {
  const SetupWallet({Key? key}) : super(key: key);

  @override
  State<SetupWallet> createState() => _SetupWalletState();
}

class _SetupWalletState extends State<SetupWallet> {

  bool loader = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addStep();
  }

  addStep() async {
    await setLastStep(currentRoute: setupRoute);
    await context.setLocale(context.supportedLocales[0]);
  }

  chainSelected({chain}) {
    Navigator.of(context).pop();
    setState(() {
      loader = true;
    });
    Navigator.of(context).pushReplacementNamed(walletCreatedRoute, arguments: chain);
    setState(() {
      loader = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                // gradient: LinearGradient(colors: [
                //   colorApp.shade300,
                //   colorApp.shade200,
                //   colorApp.shade100,
                // ]
                color: colorApp.shade800
              )
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AddBox(
                  label: tr(LocaleKeys.create_wallet),
                  callback: () {
                    showCupertinoModalBottomSheet(
                      expand: false,
                      context: context,
                      builder: (builder) {
                        return SelectChain(callback: chainSelected);
                      }
                    );
                  },
                  iconData: Icons.add,
                ),
                const SizedBox(height: 20.0),
                AddBox(
                  label: tr(LocaleKeys.import_wallet),
                  callback: () {

                  },
                  iconData: Icons.download_rounded,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Container(
              width: SizeConfig.screenWidth!,
              color: colorApp,
              alignment: Alignment.center,
              padding: SizeConfig.appEdgeInsets,
              child: AppText(
                text: tr(LocaleKeys.create_wallet_description),
              ),
            ),
          ),
          if ( loader )
          Container(
            color: colorApp.shade200,
          ),
          if ( loader )
            Positioned(
              top: SizeConfig.statusBar!,
              right: 0,
              left: 0,
              child: const LinearLoader(),
            ),
        ],
      ),
    );
  }
}
