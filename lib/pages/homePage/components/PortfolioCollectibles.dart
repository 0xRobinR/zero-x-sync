import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'package:wallet/components/Loader/LinearLoader.dart';
import 'package:wallet/components/Loader/ListLoader.dart';
import 'package:wallet/lib/mocks/collectibleMockData.dart';
import 'package:wallet/pages/homePage/components/CollectiblesShimmer.dart';
import 'package:wallet/pages/homePage/components/PortfolioCollectiblesItem.dart';
import 'package:wallet/theme/spacing.dart';
import 'package:wallet/utils/devLogger.dart';

class PortfolioCollectibles extends StatefulWidget {
  const PortfolioCollectibles({Key? key}) : super(key: key);

  @override
  State<PortfolioCollectibles> createState() => _PortfolioCollectiblesState();
}

class _PortfolioCollectiblesState extends State<PortfolioCollectibles> {

  Timer? timer;
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final _timer = Timer(const Duration(milliseconds: 1000), () {
      setState(() {
        isLoading = false;
      });
    });

    setState(() {
      timer = _timer;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const CollectiblesShimmer();
    } else {
      return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          ...nftCollection.map((e) => PortfolioCollectiblesItem(collectible: e)).toList(),
          const AddCollectible()
        ],
      )
    );
    }
  }
}
