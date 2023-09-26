import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';
import 'package:wallet/pages/createWallet/components/PhraseWidget.dart';

class QuestionnaireWidget extends StatefulWidget {
  final String word;
  final bool correct;
  final VoidCallback fallback;
  final VoidCallback callback;
  const QuestionnaireWidget({Key? key, required this.word, required this.correct, required this.callback, required this.fallback}) : super(key: key);

  @override
  State<QuestionnaireWidget> createState() => _QuestionnaireWidgetState();
}

class _QuestionnaireWidgetState extends State<QuestionnaireWidget> {
  late bool correct;
  bool showAnswer = false;
  bool showWrong = false;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    correct = widget.correct;
  }
  
  onSelect() {
    setState(() {
      showAnswer = correct;
      showWrong = !correct;
    });

    if ( showAnswer ) {
      Timer(const Duration(milliseconds: 100), () {
        widget.callback.call();
      });
    }

    if ( showWrong ) {
      Vibration.vibrate();
      Timer(const Duration(milliseconds: 100), () {
        widget.fallback.call();
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelect,
      child: PhraseWidget(word: widget.word, showAnswer: showAnswer, showQuestionnaire: true, showWrong: showWrong,),
    );
  }
}
