import 'dart:typed_data';

import 'package:bip32/bip32.dart';
import 'package:bip39/bip39.dart';
import 'package:bs58/bs58.dart';
import 'package:hex/hex.dart';
import 'package:wallet/chains/interface/IChainWallet.dart';
import 'package:wallet/chains/tron/utils/addressHelper.dart';
import 'package:wallet/config/chainWallet.dart';
import 'package:wallet/utils/devLogger.dart';

import '../../utils/computeAddress.dart';


class TronWallet extends IChainWallet {
  String privateKey;
  TronWallet({required this.privateKey});

  @override
  String getAddress() {
    String addressHex = "41"+getETHAddress(privateKey: privateKey).substring(2);
    final doubleSha256 = getSHA256(message: getSHA256(message: addressHex));
    final checkSum = (doubleSha256).substring(0, 8);
    final tron58 = HEX.decode(addressHex+checkSum) as Uint8List;
    final tronAddress = base58.encode(tron58);
    return tronAddress;
  }

  @override
  double getBalance() {
    // TODO: implement getBalance
    return 0;
  }

  static String getPrivateKeyFromSeed({required String seed}) {
    if ( !validateMnemonic(seed) ) {
      throw Exception("Invalid Mnemonic Passed");
    }
    final _seed = mnemonicToSeed(seed);
    final node = BIP32.fromSeed(_seed);
    final child = node.derivePath(tronDerivePath);
    return HEX.encode(child.privateKey!.toList());
  }

}