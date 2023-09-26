import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wallet/assets/Colors.dart';
import 'package:wallet/components/AppText.dart';
import 'package:wallet/generated/codegen_loader.g.dart';
import 'package:wallet/theme/spacing.dart';
import 'package:wallet/utils/formatValue.dart';

class Portfolio extends StatefulWidget {
  const Portfolio({Key? key}) : super(key: key);

  @override
  State<Portfolio> createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(text: tr(LocaleKeys.my_balance)),
            const VerticalSpacing(of: 5.0),
            AppText(text: formatPrice(value: 124234.2348), fontSize: 30.0),
            const VerticalSpacing(of: 10.0),
          ],
        ),
      ],
    );
  }
}
