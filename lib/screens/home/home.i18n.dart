import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  static var t = new Translations('en_us') +
  {
    'en_us': 'Discover',
    'pt_br': 'Descubra',
  } + 

  {
    'en_us': 'Find your dream place here',
    'pt_br': 'Encontre seu lugar dos sonhos aqui',
  } + 

  {
    'en_us': 'Categories',
    'pt_br': 'Categorias',
  };

  String get i18n => localize(this, t);
  String plural(int value) => localizePlural(value, this, t);
  String version(Object modifier) => localizeVersion(modifier, this, t);

  Map<String, String> allVersions() => localizeAllVersions(this, t);
}
