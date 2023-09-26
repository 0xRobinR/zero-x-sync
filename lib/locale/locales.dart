
import 'dart:ui';

import 'package:wallet/lib/models/LanguageLocale.dart';

final en = LanguageLocale(
  locale: const Locale("en"),
  name: "english"
);

final hi = LanguageLocale(
  locale: const Locale("hi"),
  name: "हिन्दी"
);

final ch = LanguageLocale(
  locale: const Locale("zh"),
  name: "中国人"
);

final fr = LanguageLocale(
  locale: const Locale("fr"),
  name: "française"
);

final languageList = [
  en,
  hi,
  ch,
  fr
];