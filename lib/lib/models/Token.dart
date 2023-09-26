import 'package:wallet/lib/models/Coin.dart';

class Token implements CoinModel {
  final String tokenImg;
  final String tokenName;
  final String tokenSymbol;
  final double tokenPrice;

  Token({
    required this.tokenImg,
    required this.tokenName,
    required this.tokenSymbol,
    required this.tokenPrice
  });

  @override
  // TODO: implement image
  String get image => throw UnimplementedError();

  @override
  // TODO: implement name
  String get name => throw UnimplementedError();

  @override
  // TODO: implement price
  double get price => throw UnimplementedError();

  @override
  // TODO: implement symbol
  String get symbol => throw UnimplementedError();

}