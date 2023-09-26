import 'package:ethers/signers/wallet.dart';
import 'package:flutter/material.dart';
import 'package:wallet/assets/Colors.dart';
import 'package:wallet/chains/btc/index.dart';
import 'package:wallet/chains/eth/index.dart';
import 'package:wallet/chains/tron/index.dart';
import 'package:wallet/components/AppText.dart';
import 'package:wallet/config/chains.dart';
import 'package:wallet/lib/models/Chain.dart';
import 'package:wallet/utils/stringHelper.dart';

class AddressPreview extends StatefulWidget {
  final String mnemonic;
  final Chain chain;

  const AddressPreview({Key? key, required this.mnemonic, required this.chain}) : super(key: key);

  @override
  State<AddressPreview> createState() => _AddressPreviewState();
}

class _AddressPreviewState extends State<AddressPreview> {

  late List<Widget> listChild;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initAddresses();
  }

  initAddresses() {
    List<Widget> _listChild = [];

    // final walletInst = Wallet.fromMnemonic(widget.mnemonic);

    // if ( widget.chain.chainUId == multiChain.chainUId) {
      // final ethWallet = ETHWallet(privateKey: walletInst.privateKey!);
      // String _ethAddress = ethWallet.getAddress();

      // final tronWallet = TronWallet(privateKey: TronWallet.getPrivateKeyFromSeed(seed: widget.mnemonic));
      // String _trxAddress = tronWallet.getAddress();

      // final btcWallet = BTCWallet(privateKey: BTCWallet.getPrivateKeyFromSeed(seed: widget.mnemonic));
      // String _btcAddress = btcWallet.getAddress();
    // }
    // _listChild.add(
    //   ListTile(
    //     title: const AppText(
    //       text: "ETH Address",
    //     ),
    //     trailing: AppText(
    //         text: _ethAddress != "" ? shortAddress(address: _ethAddress) : "..."
    //     ),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: colorApp.shade800,
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const AppText(text: "Address Preview"),
            const SizedBox(height: 20.0,),
          ],
        )
      ),
    );
  }
}



