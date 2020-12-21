import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  static var t = new Translations('en_us') +
  {
    'en_us': 'House'
        .one('House')
       .many('Houses'),
    'pt_br': 'Casa'
        .one('Casa')
       .many('Casas'),
  } + 
  {
    'en_us': 'Apartment'
        .one('Apartment')
       .many('Apartments'),
    'pt_br': 'Apartamento'
        .one('Apartamento')
       .many('Apartamentos'),
  } + 
  {
    'en_us': 'Building'
        .one('Building')
       .many('Buildings'),
    'pt_br': 'Prédio'
        .one('Prédio')
       .many('Prédios'),
  } +  
  {
    'en_us': 'Commercial Building'
        .one('Commercial Building')
       .many('Commercial Buildings'),
    'pt_br': 'Sala Comercial'
        .one('Sala Comercial')
       .many('Salas Comerciais'),
  } +
  {
    'en_us': 'Business'
        .one('Business')
       .many('Businesses'),
    'pt_br': 'Estabelecimento'
        .one('Estabelecimento')
       .many('Estabelecimentos'),
  } + 
  {
    'en_us': 'Condo'
        .one('Condo')
       .many('Condos'),
    'pt_br': 'Condomínio'
        .one('Condomínio')
       .many('Condomínios'),
  } + 
  {
    'en_us': 'Kitchenette'
        .one('Kitchenette')
       .many('Kitchenettes'),
    'pt_br': 'Quitinete'
        .one('Quitinete')
       .many('Quitinetes'),
  } + 
  {
    'en_us': 'Mansion'
        .one('Mansion')
       .many('Mansions'),
    'pt_br': 'Mansão'
        .one('Mansão')
       .many('Mansões'),
  } + 
  {
    'en_us': 'Semi-detached'
        .one('Semi-detached')
       .many('Semi-detacheds'),
    'pt_br': 'Geminado'
        .one('Geminado')
       .many('Geminados'),
  } + 
  {
    'en_us': 'Parcel of land'
        .one('Parcel of land')
       .many('Parcel of land'),
    'pt_br': 'Terreno'
        .one('Terreno')
       .many('Terrenos'),
  } + 
  {
    'en_us': 'Farm'
        .one('Farm')
       .many('Farms'),
    'pt_br': 'Fazenda'
        .one('Fazenda')
       .many('Fazendas'),
  };

  String get i18n => localize(this, t);
  String plural(int value) => localizePlural(value, this, t);
  String version(Object modifier) => localizeVersion(modifier, this, t);

  Map<String, String> allVersions() => localizeAllVersions(this, t);
}
