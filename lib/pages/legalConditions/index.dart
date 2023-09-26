import 'package:flutter/material.dart';
import 'package:wallet/assets/Colors.dart';
import 'package:wallet/assets/SizeConfig.dart';
import 'package:wallet/components/AppText.dart';
import 'package:wallet/config/index.dart';
import 'package:wallet/hooks/useSteps.dart';
import 'package:wallet/pages/legalConditions/components/LegalScreen.dart';

class LegalConditions extends StatefulWidget {
  const LegalConditions({Key? key}) : super(key: key);

  @override
  State<LegalConditions> createState() => _LegalConditionsState();
}

class _LegalConditionsState extends State<LegalConditions> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addStep();
  }

  addStep() async {
    await setLastStep(currentRoute: legalRoute);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                colorApp.shade300,
                colorApp.shade200,
                colorApp.shade100,
              ])),
            )
          ),
          const Positioned(
            top: 0,
            bottom: 0,
            right: 0,
            left: 0,
            child: LegalScreen(),
          ),
          Positioned(
            bottom: 10,
            right: 0,
            left: 0,
            child: Container(
              color: colorApp.shade500,
              width: SizeConfig.screenWidth! * 0.8,
              padding: EdgeInsets.all(SizeConfig.appPadding!),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const AppText(
                    text: "By clicking 'Continue' you accept the privacy policy & terms of services",
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                    ),
                    textAlign: TextAlign.center
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        setupRoute
                      );
                    },
                    child: const AppText(
                      text: 'Continue',
                    )
                  )
                ],
              ),
            ),
          )
        ]
      )
    );
  }
}
