import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:wallet/assets/Colors.dart';
import 'package:wallet/assets/SizeConfig.dart';
import 'package:wallet/components/AppText.dart';
import 'package:wallet/components/Coin/CoinIcon.dart';
import 'package:wallet/components/PriceWidget.dart';
import 'package:wallet/lib/models/Coin.dart';
import 'package:wallet/theme/spacing.dart';
import 'package:wallet/utils/formatValue.dart';

class Coin extends StatefulWidget {
  final CoinModel coin;
  const Coin({Key? key, required this.coin}) : super(key: key);

  @override
  State<Coin> createState() => _CoinState();
}

class _CoinState extends State<Coin> {
  Color? coinColor;
  PaletteGenerator? paletteGenerator;

  @override
  initState(){
    super.initState();

    _updatePalette();
  }

  _updatePalette() async {
    paletteGenerator = await PaletteGenerator.fromImageProvider(
      CachedNetworkImageProvider(widget.coin.image)
    );

    setState(() {
      coinColor = paletteGenerator?.dominantColor?.color;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Container(
      // width: 80,
      margin: const EdgeInsets.only(left: 5.0, right: 5),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: coinColor?.withOpacity(0.4) ?? colorApp.shade200,
        borderRadius: const BorderRadius.all(Radius.circular(20.0)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CoinIcon(coinImg: widget.coin.image),
          const VerticalSpacing(of: 5.0,),
          AppText(text: "${widget.coin.name.toLowerCase()} ( ${widget.coin.symbol.toLowerCase()} )"),
          const VerticalSpacing(of: 5.0,),
          AppText(text: formatPrice(value: widget.coin.price), fontSize: 20.0)
        ],
      ),
    );
  }
}
