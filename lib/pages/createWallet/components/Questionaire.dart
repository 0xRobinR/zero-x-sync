import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:wallet/assets/Colors.dart';
import 'package:wallet/components/AppText.dart';
import 'package:wallet/generated/codegen_loader.g.dart';
import 'package:wallet/pages/createWallet/components/PhraseWidget.dart';
import 'package:wallet/pages/createWallet/components/QuestionnaireWidget.dart';

class Questionnaire extends StatefulWidget {
  final List<String> words;
  final String correctWord;
  final int wordNumber;
  final VoidCallback callback;
  final VoidCallback fallback;
  final int totalPassed;

  const Questionnaire({Key? key, required this.words, required this.correctWord, required this.wordNumber, required this.callback, required this.fallback, required this.totalPassed}) : super(key: key);

  @override
  State<Questionnaire> createState() => _QuestionnaireState();
}

class _QuestionnaireState extends State<Questionnaire> {

  final List<Widget> _widgets = [];

  @override
  void initState() {
    super.initState();
    initWidget();
  }

  initWidget() {
    widget.words.shuffle();
    for ( String s in widget.words ) {
      _widgets.add(
        QuestionnaireWidget(
          word: s,
          correct: (widget.correctWord == s),
          callback: widget.callback,
          fallback: widget.fallback,
        )
      );
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: colorApp,
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AppText(text: tr(LocaleKeys.choose_word, namedArgs: { "number": widget.wordNumber.toString() })),
                StepProgressIndicator(
                  totalSteps: 3,
                  currentStep: widget.totalPassed,
                  selectedColor: Colors.green.shade200,
                ),
              ],
            ),
            GridView.count(
              padding: const EdgeInsets.all(15.0),
              crossAxisCount: 3,
              children: _widgets,
              shrinkWrap: true,
            ),
            const SizedBox(height: 20,),
          ],
        )
      )
    );
  }
}
