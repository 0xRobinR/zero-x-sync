import 'dart:async';
import 'dart:math';
import 'package:clipboard/clipboard.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import 'package:wallet/assets/Colors.dart';
import 'package:wallet/components/AppText.dart';
import 'package:wallet/components/Buttons/AppButton.dart';
import 'package:wallet/components/Loader/LinearLoader.dart';
import 'package:wallet/config/chains.dart';
import 'package:wallet/config/index.dart';
import 'package:wallet/generated/codegen_loader.g.dart';
import 'package:wallet/hooks/useSteps.dart';
import 'package:wallet/lib/models/Chain.dart';
import 'package:wallet/lib/services/notifications/notificationService.dart';
import 'package:wallet/lib/services/wallet/KeyUtils.dart';
import 'package:wallet/lib/services/wallet/WalletUtils.dart';
import 'package:wallet/pages/createWallet/components/Addresses.dart';
import 'package:wallet/pages/createWallet/components/PhraseWidget.dart';
import 'package:wallet/pages/createWallet/components/Questionaire.dart';
import 'package:wallet/pages/createWallet/components/SuccessDialog.dart';
import 'package:wallet/utils/devLogger.dart';
import 'package:wallet/utils/notificationHelper.dart';

class CreateWallet extends StatefulWidget {
  final Chain? chain;
  const CreateWallet({Key? key, this.chain}) : super(key: key);

  @override
  State<CreateWallet> createState() => _CreateWalletState();
}

class _CreateWalletState extends State<CreateWallet> {

  String? walletIdCreated;

  List<String> phrase = [];
  List<int> passedNumbers = [];
  List<bool> passedQuestions = [];

  int totalToPass = 3;

  Widget? phraseWidget;
  Chain? walletChainInfo;
  bool isLoading = true;
  bool isQuestionnaire = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addStep();
  }

  addStep() async {
    await setLastStep(currentRoute: walletCreatedRoute);
    Timer(const Duration(milliseconds: 500), initWallet);
  }

  initWallet() async {
    var uid = const Uuid();

    final sharedPrefs = await SharedPreferences.getInstance();
    String walletId = uid.v4();

    String? _getSavedWallet = sharedPrefs.getString('walletCreated');
    walletId = _getSavedWallet ?? walletId;

    setState(() {
      walletIdCreated = walletId;
    });

    if ( _getSavedWallet == null ) {
      setState(() {
        walletChainInfo = widget.chain;
      });
      await sharedPrefs.setString('walletCreated', walletId);
      await sharedPrefs.setString('chainSelected', walletChainInfo!.chainUId!);
    } else {
      String? chain = sharedPrefs.getString('chainSelected');
      Chain? getChain = getChainFromList(allChains, chain);
      setState(() {
        walletChainInfo = getChain!;
      });
    }


    WalletUtils _walletUtils = WalletUtils(
        walletID: walletId,
        preferences: sharedPrefs,
        chain: walletChainInfo!
    );

    KeyUtils _keyUtils = KeyUtils(wallet: _walletUtils);
    String mnemonicPhrase = _keyUtils.getMnemonic() ?? _keyUtils.generateMnemonic();
    await _keyUtils.setupFromMnemonic(mnemonicPhrase);
    await _walletUtils.setChain();

    setState(() {
      phrase = mnemonicPhrase.split(" ");
    });

    generatePhraseWidget();
    showSuccess();
  }

  generatePhraseWidget() {

    if ( phrase.isEmpty ) {
      return;
    }

    List<Widget> allWidgets = [];
    for (var i = 0; i < phrase.length; i ++) {
      allWidgets.add(
        PhraseWidget(word: phrase[i])
      );
    }
    phraseWidget = GridView.count(
      padding: const EdgeInsets.all(15.0),
      crossAxisCount: phrasePerRow,
      children: allWidgets,
      shrinkWrap: true,
    );

    setState(() {
      isLoading = false;
    });
  }

  showSuccess() {
    if ( walletChainInfo != null ) {
      showCupertinoDialog(
          context: context,
          builder: (builder) {
            return SuccessDialog(
                walletName: walletChainInfo!.chainName!
            );
          }
      );
    }
  }

  showAddressPreview() {
    if ( walletChainInfo != null ) {
      showCupertinoModalBottomSheet(
          context: context,
          expand: false,
          builder: (builder) {
            return AddressPreview(
              mnemonic: phrase.join(" "),
              chain: walletChainInfo!,
            );
          }
      );
    }
  }

  copyPhrase() {
    FlutterClipboard.copy(phrase.join(" "));
    NotificationService.flutterLocalNotificationsPlugin.show(
        copyID,
        tr(LocaleKeys.notification, namedArgs: { 'title': tr(LocaleKeys.backup_phrase) }),
        tr(LocaleKeys.phrase_copied),
        platformChannelSpecifics
    );
  }

  getNumber(List<int> previous){
    final random = Random();
    final number = random.nextInt(phrase.length);
    return !previous.contains(number) ? number : getNumber(previous);
  }

  nextStep({success=false, error=false, numberPassed=0}) async {
    final random = Random();

    setState(() {
      isLoading = true;
      isQuestionnaire = true;
    });

    if ( success ) {
      passedQuestions.add(true);
      passedNumbers.add(numberPassed);
      Navigator.of(context).pop();
    }
    if ( error ) {
      passedQuestions.clear();
      passedNumbers.clear();

      Navigator.of(context).pop();
      setState(() {
        isLoading = false;
        isQuestionnaire = false;
      });
      return;
    }

    if ( passedQuestions.length == 3 ) {
      final sharedPrefs = await SharedPreferences.getInstance();
      WalletUtils _walletUtils = WalletUtils(
          walletID: walletIdCreated!,
          preferences: sharedPrefs,
          chain: walletChainInfo!
      );
      _walletUtils.backupDone(true);
      logD(title: "ChainSelected: ${_walletUtils.getChain()}");
      await sharedPrefs.setString(currentWallet, walletIdCreated!);
      Navigator.of(context).pushReplacementNamed(appWalletRoute);
      return;
    }

    final number = passedNumbers.isEmpty ? random.nextInt(phrase.length) : getNumber(passedNumbers);

    final number2 = getNumber([number]);
    final number3 = getNumber([number, number2]);

    final words = [
      phrase[number],
      phrase[number2],
      phrase[number3],
    ];

    words.shuffle();

    showCupertinoModalBottomSheet(
      context: context,
      expand: false,
      bounce: true,
      enableDrag: true,
      builder: (builder) {
        return WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: Questionnaire(
            words: words,
            correctWord: phrase[number],
            wordNumber: number+1,
            callback: () {
              nextStep(success: true, numberPassed: number);
            },
            fallback: () {
              nextStep(error: true);
            }, totalPassed: (passedQuestions.length),
          ),
        );
      }
    );
  }

  skipStep() {
    Navigator.of(context).pushReplacementNamed(appWalletRoute);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    setState(() {
      isLoading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorApp,
      appBar: AppBar(
        title: AppText(
          text: walletChainInfo != null ?
          "${tr(LocaleKeys.backup_phrase)} - ${walletChainInfo!.chainName}"
          : tr(LocaleKeys.backup_phrase),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: isLoading ? [ const LinearLoader() ] : [
          const SizedBox(height: 20.0,),
          Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  spreadRadius: 5.0,
                  blurRadius: 10.0,
                  color: Colors.white12
                )
              ],
              borderRadius: BorderRadius.all(Radius.circular(15.0))
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                phraseWidget!,
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AppButton(
                      label: tr(LocaleKeys.copy),
                      callback: copyPhrase,
                    ),
                    AppButton(
                      label: tr(LocaleKeys.next),
                      callback: nextStep,
                      color: phraseColor,
                      textColor: Colors.black,
                    ),
                    AppButton(
                      label: tr(LocaleKeys.later),
                      callback: skipStep,
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}