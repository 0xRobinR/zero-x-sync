import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:wallet/assets/Colors.dart';
import 'package:wallet/config/index.dart';
import 'package:wallet/generated/codegen_loader.g.dart';
import 'package:wallet/hooks/useSteps.dart';
import 'package:wallet/pages/homePage/index.dart';
import 'package:wallet/pages/settingsPage/index.dart';

class AppWallet extends StatefulWidget {
  const AppWallet({Key? key}) : super(key: key);

  @override
  State<AppWallet> createState() => _AppWalletState();
}

class _AppWalletState extends State<AppWallet> {

  int currentPage = 0;
  final pageController = PreloadPageController();

  @override
  void initState() {
    super.initState();
    addStep();
  }

  addStep() async {
    await setLastStep(currentRoute: appWalletRoute);
  }

  changePage(idx) {
    pageController.jumpToPage(idx);
    setState(() {
      currentPage = idx;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: ThemeProvider.themeOf(context).id == "dark" ? colorApp : Colors.white12
    ));

    return Scaffold(
      body: PreloadPageView(
        controller: pageController,
        preloadPagesCount: 3,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (page) {
          setState(() {
            currentPage = page;
          });
        },
        children: [
          const HomePage(pageNumber: "pageNumber"),
          Container(color: Colors.red.shade200,),
          Container(color: Colors.green.shade200,),
          const SettingsPage(),
        ],
      ),
      bottomNavigationBar: SnakeNavigationBar.color(
        behaviour: SnakeBarBehaviour.floating,
        backgroundColor: ThemeProvider.themeOf(context).id == "dark" ? colorApp : Colors.white12,
        snakeViewColor: ThemeProvider.themeOf(context).id == "dark" ? Colors.white: colorApp,
        snakeShape: SnakeShape.indicator,
        showSelectedLabels: true,
        selectedItemColor:  ThemeProvider.themeOf(context).id == "dark" ? Colors.white: colorApp,
        currentIndex: currentPage,
        unselectedItemColor: ThemeProvider.themeOf(context).id == "dark" ? Colors.white60: colorApp.shade600,
        showUnselectedLabels: true,
        onTap: changePage,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.crop_landscape),
            label: tr(LocaleKeys.home)
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.search_rounded),
            label: tr(LocaleKeys.browse)
          ),
          BottomNavigationBarItem(
              icon: const Icon(Icons.account_balance_wallet),
              activeIcon: const Icon(Icons.account_balance_wallet_rounded),
              label: tr(LocaleKeys.wallets)
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings),
            label: tr(LocaleKeys.settings)
          )
        ],
      ),
    );
  }
}
