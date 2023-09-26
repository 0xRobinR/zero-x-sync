import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallet/assets/SizeConfig.dart';
import 'package:wallet/components/AppText.dart';

class SplashPage extends StatelessWidget {
  String splashHead;
  String splashPara1;
  String splashPara2;

  SplashPage({
    Key? key,
    required this.splashHead,
    required this.splashPara1,
    required this.splashPara2
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Stack(
        children:[
          Container(
            alignment: Alignment.center,
            child: Container(
              foregroundDecoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 5,
                    blurRadius: 7,
                  ),
                ],
              ),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 5,
                      blurRadius: 7,
                    ),
                  ],
                  gradient: LinearGradient(
                      colors: [
                        Colors.white,
                        Colors.white70
                      ]
                  )
              ),
              child: SvgPicture.asset(
                'assets/ContainerBox.svg',
                fit: BoxFit.fitWidth,
                colorBlendMode: BlendMode.overlay,
              ),
            ),
          ),
          Container(
              alignment: Alignment.center,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    AppText(
                      text: splashHead,
                      color: Colors.black,
                      fontSize: SizeConfig.appBigText,
                    ),
                    const SizedBox(
                        height: 20.0
                    ),
                    AppText(
                      text: splashPara1,
                      color: Colors.black,
                      fontSize: SizeConfig.appText,
                    ),
                    AppText(
                      text: splashPara2,
                      color: Colors.black,
                      fontSize: SizeConfig.appText,
                    ),
                  ]
              )
          )
        ]
    );
  }
}
