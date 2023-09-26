import 'package:flutter/material.dart';
import 'package:wallet/assets/Colors.dart';
import 'package:wallet/assets/SizeConfig.dart';
import 'package:wallet/components/AppText.dart';
import 'package:wallet/components/Buttons/PillButton.dart';
import 'package:wallet/config/index.dart';
import 'package:wallet/hooks/useSteps.dart';
import 'package:wallet/pages/splashScreen/components/ProgressBar.dart';
import 'package:wallet/pages/splashScreen/components/Screen.dart';
import 'package:preload_page_view/preload_page_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final PreloadPageController _pageController = PreloadPageController();
  int currentPage = 1;
  static const totalPage = 6;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addStep();
  }

  addStep() async {
    await setLastStep(currentRoute: splashRoute);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: Stack(children: [
        Positioned.fill(
            child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
            colorApp.shade300,
            colorApp.shade200,
            colorApp.shade100,
          ])),
        )),
        Positioned(
          top: SizeConfig.statusBar,
          child: Padding(
            padding: EdgeInsets.all(SizeConfig.appPadding!),
            child: ProgressBar(
              current: currentPage,
              total: totalPage,
            ),
          ),
        ),
        Positioned(
          top: 0,
          bottom: 0,
          right: 0,
          left: 0,
          child: PreloadPageView(
              controller: _pageController,
              onPageChanged: (id) {
                setState(() {
                  currentPage = id + 1;
                });
              },
              preloadPagesCount: 6,
              children: const [
                Screen(
                    splashHead: 'Secured',
                    splashPara1: 'Private Key And Word Phrases Always',
                    splashPara2: 'Stay Inside Your Wallet',
                    imgAssetSrc: 'assets/Splash1.svg'),
                Screen(
                    splashHead: 'Wallet',
                    splashPara1: 'All Your Assets At One Place Easily',
                    splashPara2: '',
                    imgAssetSrc: 'assets/Splash2.svg'),
                Screen(
                    splashHead: 'DECENTRALIZED\nAPPS',
                    splashPara1: 'Discover, Earn, Utilize, Trade And Much More',
                    splashPara2: '',
                    imgAssetSrc: 'assets/Splash3.svg'),
                Screen(
                    splashHead: 'EARN ASSETS',
                    splashPara1: 'Curated By LOVELY INU, Airdrop Events',
                    splashPara2: 'And Giveaways',
                    imgAssetSrc: 'assets/Splash4.svg'),
                Screen(
                    splashHead: 'ENJOY NEW\nFEATURES',
                    splashPara1: 'Crypto price Indicator, Set price Alerts',
                    splashPara2: 'And Get Notified',
                    imgAssetSrc: 'assets/Splash5.svg'),
                Screen(
                    splashHead: 'TRADE ASSETS',
                    splashPara1: 'Trade Safely And Anonymously',
                    splashPara2: '',
                    imgAssetSrc: 'assets/Splash6.svg'),
              ]),
        ),
        if (currentPage != (totalPage)) Positioned(
          top: SizeConfig.statusBar,
          right: 0,
          child: Padding(
            padding: EdgeInsets.all(SizeConfig.appPadding!),
            child: SizedBox(
              height: SizeConfig.defaultSize! + 20,
              // decoration: BoxDecoration(boxShadow: [
              //   BoxShadow(color: colorApp, spreadRadius: 1.0, blurRadius: 10.0)
              // ]),
              child: PillButton(
                text: 'Skip',
                callback: () {
                  _pageController.animateToPage(
                    totalPage - 1,
                    duration: const Duration(seconds: 1),
                    curve: Curves.ease,
                  );
                },
              ),
            ),
          ),
        ),

        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: (currentPage == (totalPage)) ?
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(legalRoute);
              },
              child: const AppText(text: 'Lets Go!')
            )
            : ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: (currentPage == 1) ? null : (){
                  _pageController.animateToPage(
                      currentPage-2,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease
                  );
                },
                icon: const Icon(Icons.arrow_back_ios_rounded),
                splashColor: colorApp.shade700,
              ),
              IconButton(
                onPressed: currentPage == totalPage ? null : (){
                  _pageController.animateToPage(
                    currentPage,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease
                  );
                },
                icon: const Icon(Icons.arrow_forward_ios_rounded),
                splashColor: colorApp.shade700,
              )
            ],
          )
        )
      ]),
    );
  }
}
