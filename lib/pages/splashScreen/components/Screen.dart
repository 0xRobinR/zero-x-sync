import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallet/pages/splashScreen/components/SplashPage.dart';

class Screen extends StatelessWidget {
  final String splashHead;
  final String splashPara1;
  final String splashPara2;
  final String imgAssetSrc;

  const Screen({
    Key? key,
    required this.splashHead,
    required this.splashPara1,
    required this.splashPara2,
    required this.imgAssetSrc
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
        bottom: -150,
        top: 150,
        right: 0,
        left: 0,
        child: SplashPage(
          splashHead: splashHead,
          splashPara1: splashPara1,
          splashPara2: splashPara2,
        ),
      ),
      Align(
        alignment: Alignment.center,
        child: Stack(children: [
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              child: SvgPicture.asset(
                imgAssetSrc,
                fit: BoxFit.fill,
                colorBlendMode: BlendMode.plus,
              ),
            ),
          )
        ]),
      )
    ]);
  }
}
