import 'package:flutter/material.dart';
import 'package:wallet/assets/Colors.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class ProgressBar extends StatelessWidget {
  final int current;
  final int total;
  const ProgressBar({Key? key, required this.current, required this.total}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StepProgressIndicator(
      totalSteps: total,
      currentStep: current,
      selectedColor: colorApp,
      unselectedColor: colorApp.shade50,
    );
  }
}
