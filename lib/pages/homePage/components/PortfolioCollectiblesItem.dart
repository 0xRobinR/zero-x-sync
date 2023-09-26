import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:wallet/assets/Colors.dart';
import 'package:wallet/components/AppText.dart';
import 'package:wallet/components/Buttons/AppButton.dart';
import 'package:wallet/components/Buttons/AppIconButton.dart';
import 'package:wallet/generated/codegen_loader.g.dart';
import 'package:wallet/lib/models/Collectible.dart';
import 'package:wallet/theme/spacing.dart';
import 'package:wallet/utils/stringHelper.dart';

class PortfolioCollectiblesItem extends StatefulWidget {
  final Collectible collectible;
  const PortfolioCollectiblesItem({Key? key, required this.collectible}) : super(key: key);

  @override
  State<PortfolioCollectiblesItem> createState() => _PortfolioCollectiblesItemState();
}

class _PortfolioCollectiblesItemState extends State<PortfolioCollectiblesItem> {
  Color? cardColor;
  PaletteGenerator? paletteGenerator;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _updateColorFromImage();
  }

  _updateColorFromImage() async {
    paletteGenerator = await PaletteGenerator.fromImageProvider(
      CachedNetworkImageProvider(widget.collectible.imageUrl)
    );

    setState(() {
      cardColor = paletteGenerator?.dominantColor?.color;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10.0, top: 10.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: CachedNetworkImageProvider(
            widget.collectible.imageUrl,
          ),
          fit: BoxFit.fitWidth,
          opacity: 0.5
        )
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: ThemeProvider.themeOf(context).id == "dark" ? colorApp.shade400 : Colors.white.withOpacity(0.5),
                borderRadius: BorderRadius.circular(20.0)
              ),
              padding: const EdgeInsets.all(5.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const VerticalSpacing(of: 10.0),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        AppText(text: "${widget.collectible.nftName} ( ${widget.collectible.nftSymbol} )".toLowerCase(), style: const TextStyle(fontWeight: FontWeight.bold),)
                      ]
                  ),
                  const VerticalSpacing(of: 10.0),
                  AppText(text: "#${widget.collectible.tokenId}".toLowerCase(), style: const TextStyle(fontWeight: FontWeight.bold),),
                  const VerticalSpacing(of: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AppButton(
                        label: "Send",
                        color: colorApp.shade200,
                        callback: (){},
                      ),
                      AppButton(
                        label: "View",
                        color: colorApp.shade200,
                        callback: (){},
                      ),
                      AppButton(
                        label: "Hide",
                        color: colorApp.shade200,
                        callback: (){},
                      )
                    ],
                  )
                ],
              )
            ),
          )
        ],
      ),
    );
  }
}


class AddCollectible extends StatelessWidget {
  const AddCollectible({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10.0, top: 10.0),
      decoration: const BoxDecoration(
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
                margin: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: ThemeProvider.themeOf(context).id == "dark" ? colorApp.shade400 : Colors.white12,
                    borderRadius: BorderRadius.circular(20.0)
                ),
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const VerticalSpacing(of: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppIconButton(
                          label: tr(LocaleKeys.add_collectibles),
                          icon: Icons.add,
                          withLabel: true,
                          callback: (){},
                        )
                      ],
                    )
                  ],
                )
            ),
          )
        ],
      ),
    );;
  }
}


