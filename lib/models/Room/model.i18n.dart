import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  static var t = new Translations('en_us') +
  {
    'en_us': 'Laundry room',
    'pt_br': 'Area de serviço',
  } + 
  {
    'en_us': 'Kitchen',
    'pt_br': 'Cozinha',
  } + 
  {
    'en_us': 'Hallway',
    'pt_br': 'Corredor',
  } + 
  {
    'en_us': 'Break room',
    'pt_br': 'Copa',
  } + 
  {
    'en_us': 'Pantry',
    'pt_br': 'Despensa',
  } + 
  {
    'en_us': 'Office',
    'pt_br': 'Escritório',
  } + 
  {
    'en_us': 'Waiting room',
    'pt_br': 'Portaria',
  } + 
  {
    'en_us': 'Bedroom',
    'pt_br': 'Quarto',
  } + 
  {
    'en_us': 'Bathroom',
    'pt_br': 'Banheiro',
  } + 
  {
    'en_us': 'Room',
    'pt_br': 'Sala',
  } + 
  {
    'en_us': 'Living room',
    'pt_br': 'Sala de estar',
  } + 
  {
    'en_us': 'Dinner room',
    'pt_br': 'Sala de jantar',
  } + 
  {
    'en_us': 'Terrace',
    'pt_br': 'Terraço',
  } + 
  {
    'en_us': 'Balcony',
    'pt_br': 'Varanda',
  } + 
  {
    'en_us': 'Entrance hall',
    'pt_br': 'Hall de entrada',
  } + 
  {
    'en_us': 'Stairs',
    'pt_br': 'Escadas',
  } + 
  {
    'en_us': 'Garage',
    'pt_br': 'Garagem',
  } + 
  {
    'en_us': 'Meeting room',
    'pt_br': 'Sala de reuniões',
  } + 
  {
    'en_us': 'Backyard',
    'pt_br': 'Quintal',
  } + 
  {
    'en_us': 'Swimming pool',
    'pt_br': 'Piscina',
  } + 
  {
    'en_us': 'Jacuzzi',
    'pt_br': 'Jacuzzi',
  } + 
  {
    'en_us': 'Lift',
    'pt_br': 'Elevador',
  } + 
  {
    'en_us': 'Playground',
    'pt_br': 'Parque infantil',
  } + 
  {
    'en_us': 'Ballroom',
    'pt_br': 'Salão de festas',
  } + 
  {
    'en_us': 'Recreation area',
    'pt_br': 'Área de lazer',
  };

  String get i18n => localize(this, t);
  String plural(int value) => localizePlural(value, this, t);
  String version(Object modifier) => localizeVersion(modifier, this, t);

  Map<String, String> allVersions() => localizeAllVersions(this, t);
}