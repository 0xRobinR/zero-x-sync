import 'package:wallet/lib/mocks/chainData.dart';
import 'package:wallet/lib/models/History.dart';

final hist1 = History(
  txnTitle: "Sent 0.05 BNB",
  chainInfo: bnbChainInfo,
  amount: 0.0523842,
  timeStamp: DateTime.now(),
  isSent: true
);

final hist2 = History(
  txnTitle: "Received 1.28 BTC",
  chainInfo: btcChainInfo,
  timeStamp: DateTime.now(),
  amount: 1.288448294,
);

final hist3 = History(
  txnTitle: "Sent 13.5 ETH",
  chainInfo: bnbChainInfo,
  timeStamp: DateTime.now(),
  amount: 13.4284,
  isSent: true
);

final hist4 = History(
  txnTitle: "Received 134.23 BNB",
  chainInfo: bnbChainInfo,
  timeStamp: DateTime.now(),
  amount: 0.0523842
);

final hist5 = History(
  txnTitle: "Received 134.23 BNB",
  chainInfo: bnbChainInfo,
  timeStamp: DateTime.now(),
  amount: 0.0523842
);

final hist6 = History(
  txnTitle: "Received 134.23 BNB",
  chainInfo: bnbChainInfo,
  timeStamp: DateTime.now(),
  amount: 0.0523842
);

final hist7 = History(
  txnTitle: "Sent 134.23 ETH",
  chainInfo: ethChainInfo,
  amount: 0.0523842,
  timeStamp: DateTime.now(),
  isSent: true
);

final hist8 = History(
  txnTitle: "Received 134.23 BNB",
  chainInfo: bnbChainInfo,
  timeStamp: DateTime.now(),
  amount: 0.0523842
);


final historyData = [
  hist1,
  hist2,
  hist3,
  hist4,
  hist5,
  hist6,
  hist7,
  hist8,
  hist1,
  hist2,
  hist3,
  hist4,
  hist5,
  hist6,
  hist7,
  hist8,
];

