import 'package:get/get.dart';

class LocalStrings extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'new_game': 'New game',
          'load_game': 'Load game',
          'settings': 'Settings',
          'exit': 'Exit',
        },
        'fr_FR': {
          'new_game': ' Nouvelle partie',
          'load_game': 'Charger une partie',
          'settings': 'Paramètres',
          'exit': 'Quitter',
        }
      };
}
