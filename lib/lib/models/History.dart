import 'package:wallet/lib/models/ChainInfo.dart';

class History {
  final String txnTitle;
  final String? txnHash;
  final double? amount;
  final DateTime? timeStamp;
  final ChainInfo? chainInfo;
  final bool isSent;

  History({required this.txnTitle, this.txnHash, this.amount, this.chainInfo, this.isSent = false, this.timeStamp});
}