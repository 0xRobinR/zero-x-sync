import 'package:wallet/chains/interface/IChainWallet.dart';
import 'package:wallet/utils/computeAddress.dart';

class ETHWallet implements IChainWallet {
  String privateKey;
  ETHWallet({required this.privateKey});

  @override
  String getAddress() {
    return getETHAddress(privateKey: privateKey);
  }

  @override
  double getBalance() {
    // TODO: implement getBalance
    throw UnimplementedError();
  }

}