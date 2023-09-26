import 'package:wallet/lib/mocks/coinMockData.dart';
import 'package:wallet/lib/models/ChainInfo.dart';

final bnbChainInfo = ChainInfo(
  explorer: "https://bscscan.com/",
  rpcURL: "rpcURL",
  nativeToken: bnbCoin
);

final btcChainInfo = ChainInfo(
  explorer: "https://blockchain.com/",
  rpcURL: "rpcURL",
  nativeToken: btcCoin
);

final ethChainInfo = ChainInfo(
  explorer: "https://etherscan.io/",
  rpcURL: "rpcURL",
  nativeToken: ethCoin
);
