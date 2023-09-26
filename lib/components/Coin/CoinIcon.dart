import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CoinIcon extends StatelessWidget {
  final String coinImg;
  const CoinIcon({Key? key, required this.coinImg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: coinImg,
      height: 30.0,
    );
  }
}
