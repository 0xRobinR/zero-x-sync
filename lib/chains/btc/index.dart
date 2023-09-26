import 'package:bip39/bip39.dart';
import 'package:bitcoin_flutter/bitcoin_flutter.dart';
import 'package:wallet/chains/interface/IChainWallet.dart';
import 'package:wallet/utils/devLogger.dart';

class BTCWallet implements IChainWallet {
  String privateKey;

  BTCWallet({required this.privateKey});

  @override
  String getAddress() {
    final wallet = Wallet.fromWIF(privateKey);
    return wallet.address;
  }

  @override
  double getBalance() {
    // TODO: implement getBalance
    throw UnimplementedError();
  }

  static String getPrivateKeyFromSeed({required String seed}) {
    final _seed = mnemonicToSeed(seed);
    final node = HDWallet.fromSeed(_seed);
    final child = node.wif;
    logD(title: "BTC Address: ${node.address}");
    return child;
  }

}