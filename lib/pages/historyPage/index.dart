import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wallet/components/AppText.dart';
import 'package:wallet/components/Loader/LinearLoader.dart';
import 'package:wallet/components/Loader/ListLoader.dart';
import 'package:wallet/pages/historyPage/components/HistoryList.dart';
import 'package:wallet/pages/historyPage/components/HistoryShimmer.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {

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
  Widget build(BuildContext context) {
    if (isLoading) {
      return const HistoryShimmer();
    } else {
      return MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: const HistoryList()
    );
    }
  }
}
