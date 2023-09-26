import 'package:flutter/material.dart';

class VerticalSpacing extends StatelessWidget {
  final double of;
  const VerticalSpacing({Key? key, required this.of}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: of,
    );
  }
}

class HorizontalSpacing extends StatelessWidget {
  final double of;
  const HorizontalSpacing({Key? key, required this.of}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: of,
    );
  }
}
