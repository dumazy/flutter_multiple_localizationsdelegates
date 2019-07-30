import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'messages_all.dart';

class CatLocalizations {
  static Future<CatLocalizations> load(Locale locale) {
    final String name = locale.languageCode;
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return CatLocalizations();
    });
  }

  static CatLocalizations of(BuildContext context) {
    return Localizations.of<CatLocalizations>(context, CatLocalizations);
  }

  String get meow {
    return Intl.message(
      '<insert cat sound>',
      name: 'meow',
    );
  }
}

class CatLocalizationsDelegate extends LocalizationsDelegate<CatLocalizations> {
  const CatLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'nl'].contains(locale.languageCode);

  @override
  Future<CatLocalizations> load(Locale locale) => CatLocalizations.load(locale);

  @override
  bool shouldReload(CatLocalizationsDelegate old) => false;
}