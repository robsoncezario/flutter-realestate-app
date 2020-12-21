import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  static var t = new Translations('en_us') +
  {
    'en_us': 'Back',
    'pt_br': 'Voltar',
  } + 

  {
    'en_us': 'Forward',
    'pt_br': 'Avançar',
  };

  String get i18n => localize(this, t);
  String plural(int value) => localizePlural(value, this, t);
  String version(Object modifier) => localizeVersion(modifier, this, t);

  Map<String, String> allVersions() => localizeAllVersions(this, t);
}
