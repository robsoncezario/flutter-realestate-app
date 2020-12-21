import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  static var t = new Translations('en_us') +
  {
    'en_us': 'Home',
    'pt_br': 'Início',
  } + 
  {
    'en_us': 'Explore',
    'pt_br': 'Descobrir',
  } + 
  {
    'en_us': 'Favorites',
    'pt_br': 'Favoritos',
  } + 
  {
    'en_us': 'Search',
    'pt_br': 'Encontrar',
  } + 
  {
    'en_us': 'Settings',
    'pt_br': 'Configurações',
  };

  String get i18n => localize(this, t);
  String plural(int value) => localizePlural(value, this, t);
  String version(Object modifier) => localizeVersion(modifier, this, t);

  Map<String, String> allVersions() => localizeAllVersions(this, t);
}
