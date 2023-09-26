import 'package:flutter/material.dart';
import 'package:wallet/components/Coin/index.dart';
import 'package:wallet/lib/mocks/coinMockData.dart';

class CoinList extends StatefulWidget {
  const CoinList({Key? key}) : super(key: key);

  @override
  State<CoinList> createState() => _CoinListState();
}

class _CoinListState extends State<CoinList> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: allCoins.length,
      itemBuilder: (context, idx) => Coin(coin: allCoins[idx]),
      separatorBuilder: (context, idx) => const SizedBox(width: 20.0,),
    );
  }
}
