import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:wallet/assets/Colors.dart';
import 'package:wallet/components/AppText.dart';
import 'package:wallet/generated/codegen_loader.g.dart';
import 'package:wallet/pages/historyPage/index.dart';
import 'package:wallet/pages/homePage/components/Header.dart';
import 'package:wallet/pages/homePage/components/PortfolioCollectibles.dart';
import 'package:wallet/pages/homePage/components/PortfolioList.dart';

class PortfolioSection extends StatefulWidget {
  const PortfolioSection({Key? key}) : super(key: key);

  @override
  State<PortfolioSection> createState() => _PortfolioSectionState();
}

class _PortfolioSectionState extends State<PortfolioSection> with TickerProviderStateMixin {
  TabController? tabController;

  List<Widget> widgets = [
    const PortfolioList(),
    const PortfolioCollectibles(),
    const HistoryPage()
  ];

  int tabIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  tabChanged(idx) {
    setState(() {
      tabIndex = idx;
    });
  }

  @override
  Widget build(BuildContext context) {
    // return SafeArea(
    //   top: false,
    //   child: Scaffold(
    //     backgroundColor: colorApp,
    //     appBar: TabBar(
    //       indicatorColor: Colors.white,
    //       controller: tabController,
    //       tabs: const [
    //         Tab(
    //           child: AppText(
    //             text: "assets"
    //           ),
    //         ),
    //         Tab(
    //           child: AppText(
    //             text: "collectibles"
    //           ),
    //         ),
    //         Tab(
    //           child: AppText(
    //             text: "history"
    //           ),
    //         )
    //       ],
    //     ),
    //     body: TabBarView(
    //       controller: tabController,
    //       children: [
    //         ...widgets.toList()
    //       ]
    //     ),
    //   ),
    // );

    return Column(
      children: [
        Header(text: tr(LocaleKeys.my_portfolio), isAction: true,),
        TabBar(
          indicatorColor: ThemeProvider.themeOf(context).id == "dark" ? Colors.white : colorApp,
          controller: tabController,
          onTap: tabChanged,
          tabs: [
            Tab(
              child: AppText(
                  text: tr(LocaleKeys.assets)
              ),
            ),
            Tab(
              child: AppText(
                  text: tr(LocaleKeys.collectibles)
              ),
            ),
            Tab(
              child: AppText(
                  text: tr(LocaleKeys.history),
              ),
            )
          ],
        ),
        widgets[tabIndex]
      ],
    );
  }
}
