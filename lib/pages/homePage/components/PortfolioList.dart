import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:wallet/components/Loader/LinearLoader.dart';
import 'package:wallet/components/Loader/ListLoader.dart';
import 'package:wallet/lib/mocks/coinMockData.dart';
import 'package:wallet/pages/homePage/components/PortfolioListItem.dart';
import 'package:wallet/pages/homePage/components/PortfolioListShimmer.dart';
import 'package:wallet/utils/devLogger.dart';

class PortfolioList extends StatefulWidget {
  const PortfolioList({Key? key}) : super(key: key);

  @override
  State<PortfolioList> createState() => _PortfolioListState();
}

class _PortfolioListState extends State<PortfolioList> with AutomaticKeepAliveClientMixin {

  Timer? timer;
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final _timer = Timer(const Duration(milliseconds: 1500), () {
      setState(() {
        isLoading = false;
      });
    });

    setState(() {
      timer = _timer;
    });

    logD(title: "Loaded;");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer?.cancel();

    logD(title: "Cancelled;");
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (isLoading) {
      return const PortfolioListShimmer();
    } else {
      return MediaQuery.removePadding(
      removeTop: true,
      context: context,
      child: ListView.separated(
          shrinkWrap: true,
          primary: false,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (ctx, idx) {
            final random = Random();
            final choices = [true, false];
            final balance = Random.secure().nextDouble();
            final balanceInUSD = balance * allCoins[idx].price;

            return PortfolioListItem(
              idx: idx,
              coin: allCoins[idx],
              isUp: choices[random.nextInt(2)],
              balanceInUSD: balanceInUSD,
              balance: balance
            );
          },
          separatorBuilder: (ctx, idx) {
            return const SizedBox(
              height: 10.0,
            );
          },
          itemCount: allCoins.length
      ),
    );
    }
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
