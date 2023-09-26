import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:wallet/components/AppText.dart';
import 'package:wallet/lib/models/History.dart';

class HistoryItem extends StatelessWidget {
  final History history;
  const HistoryItem({Key? key, required this.history}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: Icon(
        !history.isSent ? Icons.call_received_rounded : Icons.call_made_rounded,
        color: !history.isSent ? Colors.green.shade100 : Colors.red.shade200,
      ),
      title: AppText(text: history.txnTitle.toLowerCase(),),
      trailing: AppText(
        text: formatDate(history.timeStamp!, [dd, '-', mm, ', ', hh, ':', mm, ' ', am]),
      ),
    );
  }
}
