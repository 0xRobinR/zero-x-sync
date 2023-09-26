import 'package:easy_localization/easy_localization.dart';

final formatter = NumberFormat.simpleCurrency(locale: "en_US");

String formatPrice({required double value}) {
  return formatter.format(value);
}