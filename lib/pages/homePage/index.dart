
import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:wallet/assets/Colors.dart';
import 'package:wallet/assets/SizeConfig.dart';
import 'package:wallet/components/AppText.dart';
import 'package:wallet/components/Buttons/AppIconButton.dart';
import 'package:wallet/components/Coin/CoinList.dart';
import 'package:wallet/components/Loader/LinearLoader.dart';
import 'package:wallet/generated/codegen_loader.g.dart';
import 'package:wallet/pages/homePage/components/Header.dart';
import 'package:wallet/pages/homePage/components/Portfolio.dart';
import 'package:wallet/pages/homePage/components/PortfolioSection.dart';
import 'package:wallet/theme/dimens.dart';
import 'package:wallet/theme/spacing.dart';

class HomePage extends StatefulWidget {
  final String pageNumber;
  const HomePage({Key? key, required this.pageNumber}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final RefreshController _refreshController = RefreshController(initialRefresh: false);
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(milliseconds: 2500), (){
      setState(() {
        isLoading = false;
      });
    });
  }

  _onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 3000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async{
    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 1000));
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: AppIconButton(
            icon: Icons.switch_account_rounded,
            callback: (){},
          ),
          title: const Padding(
            padding: EdgeInsets.all(5.0),
              child: Portfolio()
          ),
          actions: [
            AppIconButton(
              icon: Icons.qr_code_scanner_rounded,
              callback: () {},
            ),
          ],
        ),
        body: isLoading ? const LinearLoader() : SmartRefresher(
          controller: _refreshController,
          enablePullDown: true,
          onRefresh: _onRefresh,
          onLoading: _onLoading,
          header: WaterDropHeader(
            refresh: SizedBox(
              height: 30.0,
              width: 30.0,
              child: SpinKitSpinningLines(color: ThemeProvider.themeOf(context).id == "dark" ? Colors.white: colorApp,)
            ),
            complete: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(text: tr(LocaleKeys.updated),),
                const HorizontalSpacing(of: 10.0),
                const Icon(Icons.check_circle),
              ],
            ),
          ),
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // const VerticalSpacing(of: paddingSizeDefault),
              // Divider(color: ThemeProvider.themeOf(context).id == "dark" ? Colors.white: colorApp,),
              const VerticalSpacing(of: 10.0,),
              Header(text: tr(LocaleKeys.top_cryptocurrencies),),
              const VerticalSpacing(of: 20.0,),
              const SizedBox(
                height: 100.0,
                child: CoinList(),
              ),
              const VerticalSpacing(of: 20.0,),
              const PortfolioSection(),
            ],
          ),
        ),
        resizeToAvoidBottomInset: true,
        extendBody: true,
      ),
    );
  }
}
