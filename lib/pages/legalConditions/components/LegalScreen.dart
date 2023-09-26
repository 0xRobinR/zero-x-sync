import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallet/assets/SizeConfig.dart';
import 'package:wallet/components/AppText.dart';
import 'package:wallet/components/Buttons/LinkButton.dart';
import 'package:wallet/config/index.dart';
import 'package:url_launcher/url_launcher.dart';

class LegalScreen extends StatelessWidget {

  const LegalScreen({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Stack(children: [
      Positioned(
        bottom: -150,
        top: 200,
        right: 0,
        left: 0,
        child: Stack(
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
                        const SizedBox(
                          height: 35.0
                        ),
                        AppText(
                          text: 'LEGAL',
                          color: Colors.black,
                          fontSize: SizeConfig.appBigText,
                        ),
                        const SizedBox(
                            height: 20.0
                        ),
                        AppText(
                          text: 'Please review our terms of service',
                          color: Colors.black,
                          fontSize: SizeConfig.appText,
                        ),
                        AppText(
                          text: '& privacy policy before using Lovely',
                          color: Colors.black,
                          fontSize: SizeConfig.appText,
                        ),
                        AppText(
                          text: 'Wallet service',
                          color: Colors.black,
                          fontSize: SizeConfig.appText,
                        ),
                        LinkButton(
                          text: 'Learn More',
                          callback: () {
                            launchUrl(
                              Uri.parse(appLegalUrl),
                              mode: LaunchMode.externalApplication
                            );
                          },
                        )
                      ]
                  )
              )
            ]
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
                'assets/Legal.svg',
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
