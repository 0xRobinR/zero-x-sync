import 'package:flutter/material.dart';
import 'package:wallet/lib/mocks/historyData.dart';
import 'package:wallet/pages/historyPage/components/HistoryItem.dart';
import 'package:wallet/theme/spacing.dart';

class HistoryList extends StatelessWidget {
  const HistoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      primary: false,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: historyData.length,
      itemBuilder: (ctx, idx) {
        return HistoryItem(history: historyData[idx],);
      },
      separatorBuilder: (ctx, idx) => const VerticalSpacing(of: 15.0),
    );
  }
}
