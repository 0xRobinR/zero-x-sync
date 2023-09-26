import 'package:flutter/material.dart';
import 'package:wallet/assets/Colors.dart';
import 'package:wallet/components/AppText.dart';

class PhraseWidget extends StatelessWidget {
  final String word;
  final bool showAnswer;
  final bool showWrong;
  final bool showQuestionnaire;
  const PhraseWidget({
    Key? key,
    required this.word,
    this.showWrong = false,
    this.showAnswer = false,
    this.showQuestionnaire = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: colorApp,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: AppText(text: word),
          ),
          if( !showQuestionnaire )
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SizedBox(
                height: 10.0,
                child: Container(
                  color: phraseColor,
                ),
              )
            ),
          if( showQuestionnaire )
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SizedBox(
                height: 10.0,
                child: Container(
                  color: Colors.grey.shade200,
                ),
              )
            ),
          if( showAnswer )
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SizedBox(
                height: 10.0,
                child: Container(
                  color: Colors.green.shade200,
                ),
              )
            ),
          if( showWrong )
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SizedBox(
                height: 10.0,
                child: Container(
                  color: Colors.red.shade200,
                ),
              )
            )
        ],
      ),
    );
  }
}
