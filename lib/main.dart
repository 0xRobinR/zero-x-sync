import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallet/assets/Assets.dart';
import 'package:wallet/assets/Colors.dart';
import 'package:flutter/material.dart';
import 'package:wallet/config/index.dart';
import 'package:wallet/lib/services/notifications/notificationService.dart';
import 'package:wallet/locale/locales.dart';
import 'package:wallet/routes/index.dart';
import 'package:theme_provider/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  EasyLocalization.ensureInitialized();
  NotificationService().init();

  Future.wait([
    precachePicture(
      ExactAssetPicture(
        SvgPicture.svgStringDecoderBuilder,
        walletCreateAsset,
      ),
      null,
    )
  ]);


  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
    .then((_) async {
      runApp(
        EasyLocalization(
          supportedLocales: [
            ...languageList.map((e) => e.locale).toList()
          ],
          fallbackLocale: const Locale('en', ''),
          path: 'assets/translations',
          child: const RestartWidget(
              child: WalletApp()
          ),
        )
      );
  });
}

class WalletApp extends StatelessWidget {
  const WalletApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      saveThemesOnChange: true,
      loadThemeOnInit: true,
      themes: [
        AppTheme(
          id: "light",
          description: "light theme for $appName",
          data: ThemeData(
            primaryColor: Colors.white12,
            iconTheme: IconThemeData(
              color: colorApp
            ),
            cardTheme: const CardTheme(
              color: Colors.white12
            ),
            appBarTheme: AppBarTheme(
              color: Colors.white12,
              elevation: 0.0,
              titleTextStyle: TextStyle(color: colorApp),
              iconTheme: IconThemeData(
                color: colorApp
              )
            ),
            textTheme: ThemeData.light().textTheme,
            listTileTheme: const ListTileThemeData(
              tileColor: Colors.white12
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(colorApp)
              )
            )
          ),
        ),
        AppTheme(
          id: "dark",
          description: "dark theme for $appName",
          data: ThemeData(
            scaffoldBackgroundColor: colorApp,
            iconTheme: const IconThemeData(
              color: Colors.white
            ),
            textTheme: ThemeData.dark().textTheme,
            cardTheme: CardTheme(
              color: colorApp
            ),
            appBarTheme: AppBarTheme(
              color: colorApp,
              elevation: 0.0,
              titleTextStyle: const TextStyle(color: Colors.white),
              iconTheme: const IconThemeData(
                  color: Colors.white
              )
            ),
            listTileTheme: ListTileThemeData(
              tileColor: colorApp,
              iconColor: Colors.white
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white12)
              )
            )
          ),
        ),
      ],
      child: ThemeConsumer(
        child: Builder(
          builder: (context) {
            return MaterialApp(
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              title: appTitle,
              theme: ThemeProvider.themeOf(context).data,
              // theme: ThemeData(
              //   textTheme: GoogleFonts.robotoTextTheme(
              //     Theme.of(context).textTheme
              //   ),
              //   primarySwatch: colorApp,
              // ),
              initialRoute: splashRoute,
              onGenerateRoute: (appUri) => generateRoute(appSettings: appUri),
              debugShowCheckedModeBanner: false,
            );
          }
        ),
      ),
    );
  }
}

class RestartWidget extends StatefulWidget {

  final Widget child;
  const RestartWidget({Key? key, required this.child}): super(key: key);

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_RestartWidgetState>()?.restartApp();
  }

  @override
  _RestartWidgetState createState() => _RestartWidgetState();
}

class _RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child,
    );
  }
}