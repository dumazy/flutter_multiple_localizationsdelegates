import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'messages_all.dart';

class DogLocalizations {
  static Future<DogLocalizations> load(Locale locale) {
    final String name = locale.languageCode;
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return DogLocalizations();
    });
  }

  static DogLocalizations of(BuildContext context) {
    return Localizations.of<DogLocalizations>(context, DogLocalizations);
  }

  String get bark {
    return Intl.message(
      '<insert dog sound>',
      name: 'bark',
    );
  }
}

class DogLocalizationsDelegate extends LocalizationsDelegate<DogLocalizations> {
  const DogLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'nl'].contains(locale.languageCode);

  @override
  Future<DogLocalizations> load(Locale locale) => DogLocalizations.load(locale);

  @override
  bool shouldReload(DogLocalizationsDelegate old) => false;
}