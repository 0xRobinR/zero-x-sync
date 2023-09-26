import 'package:flutter/material.dart';
import 'package:wallet/components/AppText.dart';
import 'package:wallet/utils/formatValue.dart';

class PriceWidget extends StatelessWidget {
  final double value;
  const PriceWidget({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppText(text: formatPrice(value: value), fontSize: 20.0,);
  }
}
