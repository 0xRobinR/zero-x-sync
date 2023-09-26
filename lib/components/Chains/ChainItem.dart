import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wallet/components/AppText.dart';
import 'package:wallet/config/endpoints.dart';
import 'package:wallet/lib/models/Chain.dart';

class ChainItem extends StatelessWidget {
  final Chain chain;
  final Function callback;
  const ChainItem({Key? key, required this.chain, required this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
      child: ListTile(
        onTap: () {
          callback(chain:chain);
          // Navigator.of(context).pushNamed(walletCreatedRoute, arguments: chain);
        },
        leading: CircleAvatar(
          child: CachedNetworkImage(
            imageUrl: assetAPI + chain.chainLogo!,
            errorWidget: (context, url, error) => const Icon(Icons.error),
            height: 25.0,
          ),
          backgroundColor: Colors.white,
        ),
        title: AppText(text: chain.chainName! + " ( " + chain.chainSymbol! + " )" ),
        subtitle: AppText(text: chain.chainStandard!),
      ),
    );
  }
}
