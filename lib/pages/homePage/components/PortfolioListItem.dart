import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wallet/assets/Colors.dart';
import 'package:wallet/components/AppText.dart';
import 'package:wallet/lib/models/Coin.dart';
import 'package:wallet/utils/formatValue.dart';

class PortfolioListItem extends StatelessWidget {
  final CoinModel coin;
  final int idx;
  final bool isUp;
  final double balanceInUSD;
  final double balance;
  const PortfolioListItem({Key? key, required this.coin, required this.isUp, required this.balanceInUSD, required this.balance, required this.idx}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(idx),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (ctx){},
            icon: Icons.upload_rounded,
            backgroundColor: Colors.green.shade100,
            label: 'Send',
          ),
          SlidableAction(
            onPressed: (ctx){},
            icon: Icons.qr_code_rounded,
            backgroundColor: Colors.green.shade100,
            label: 'Receive',
          ),
        ],
      ),
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        extentRatio: 0.25,
        children: [
          SlidableAction(
            onPressed: (ctx){},
            icon: Icons.visibility_off,
            backgroundColor: Colors.red.shade100,
            label: 'Remove',
          ),
        ],
      ),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        onTap: (){},
        leading: CircleAvatar(
          child: CachedNetworkImage(
            imageUrl: coin.image,
          ),
        ),
        title: AppText(text: coin.name.toLowerCase()),
        subtitle: Row(
          children: [
            AppText(
              text: formatPrice(
                value: coin.price
              ),
              fontSize: 12.0,
            ),
            isUp
                ? const Icon(Icons.arrow_drop_up_sharp, color: Colors.green,)
                : const Icon(Icons.arrow_drop_down_sharp, color: Colors.red,)
          ],
        ),
        trailing: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            AppText(
              text: formatPrice(value: balanceInUSD),
            ),
            AppText(
              text: " ${balance.toStringAsFixed(2)} ${coin.symbol.toLowerCase()}",
            )
          ],
        ),
      ),
    );
  }
}
