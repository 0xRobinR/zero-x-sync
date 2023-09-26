import 'package:wallet/lib/models/Coin.dart';

class ChainInfo {
  final String explorer;
  final String rpcURL;
  final CoinModel nativeToken;

  ChainInfo({required this.explorer, required this.rpcURL, required this.nativeToken});
}