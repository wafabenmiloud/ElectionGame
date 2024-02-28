import 'package:gamev2/controllers/create_new_game_controller.dart';
import 'package:gamev2/models/country_laws_model.dart';

import 'package:gamev2/utils/constants.dart';
import 'package:gamev2/utils/database_helper.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class CountryEffectsRepo {
  Future<List<Map<String, dynamic>>> getMessagesResponsesEffects(
      int resId) async {
    final current = CreateNewGameController.to.currentSaveGame.value;
    final db = await DatabaseHelper.instance.currentDatabase(current);
    try {
      final list = await db.rawQuery(
          "SELECT country_effects.*, "
          "country_effects_init.* "
          "FROM country_effects "
          "JOIN country_effects_init ON country_effects.country_effects_init_id = country_effects_init.id "
          "WHERE country_effects.item_type = 'MSG_RESP' AND country_effects.item_id = ?",
          [resId]);
      return list;
    } catch (e) {
      print('Error occurred while fetching messages: $e');
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> getDemandsEffects(int demId) async {
    final current = CreateNewGameController.to.currentSaveGame.value;
    final db = await DatabaseHelper.instance.currentDatabase(current);
    try {
      final list = await db.rawQuery(
          "SELECT country_effects.*, "
          "country_effects_init.* "
          "FROM country_effects "
          "JOIN country_effects_init ON country_effects.country_effects_init_id = country_effects_init.id "
          "WHERE country_effects.item_type = 'ADVISOR' AND country_effects.item_id = ? ",
          [demId]);
      return list;
    } catch (e) {
      print('Error occurred while fetching messages: $e');
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> getLawsEffects(int lawId) async {
    final current = CreateNewGameController.to.currentSaveGame.value;
    final db = await DatabaseHelper.instance.currentDatabase(current);
    try {
      final list = await db.rawQuery(
          "SELECT country_effects.*, "
          "country_effects_init.* "
          "FROM country_effects "
          "JOIN country_effects_init ON country_effects.country_effects_init_id = country_effects_init.id "
          "WHERE country_effects.item_type = 'LAW' AND country_effects.item_id = ? ",
          [lawId]);
      return list;
    } catch (e) {
      print('Error occurred while fetching messages: $e');
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> getRessourceEffects(int resId) async {
    final current = CreateNewGameController.to.currentSaveGame.value;
    final db = await DatabaseHelper.instance.currentDatabase(current);
    try {
      final list = await db.rawQuery(
          "SELECT country_effects.*, "
          "country_effects_init.* "
          "FROM country_effects "
          "JOIN country_effects_init ON country_effects.country_effects_init_id = country_effects_init.id "
          "WHERE country_effects.item_type = 'UPDATE_RESOURCE' AND country_effects.item_id = ? ",
          [resId]);
      return list;
    } catch (e) {
      print('Error occurred while fetching messages: $e');
      return [];
    }
  }

  Future<void> updateResponseEffects(
      num changeValue, String attribute, String type, int countryId) async {
    final current = CreateNewGameController.to.currentSaveGame.value;
    final db = await DatabaseHelper.instance.currentDatabase(current);

    try {
      if (type == 'positif') {
        await db.rawUpdate(
          'UPDATE country_datas '
          'SET $attribute = $attribute + ?'
          'WHERE country_id = ?',
          [changeValue, countryId],
        );
      } else {
        await db.rawUpdate(
          'UPDATE country_datas '
          'SET $attribute = $attribute - ?'
          'WHERE country_id = ?',
          [changeValue, countryId],
        );
      }
    } catch (e) {
      print('Error occurred while updating country laws: $e');
    }
  }

  Future<void> updateLawsEffects(
      num changeValue, String attribute, String type, int countryId) async {
    final current = CreateNewGameController.to.currentSaveGame.value;
    final db = await DatabaseHelper.instance.currentDatabase(current);

    try {
      if (type == 'positif') {
        await db.rawUpdate(
          'UPDATE country_datas '
          'SET $attribute = $attribute + ?'
          'WHERE country_id = ?',
          [changeValue, countryId],
        );
      } else {
        await db.rawUpdate(
          'UPDATE country_datas '
          'SET $attribute = $attribute - ?'
          'WHERE country_id = ?',
          [changeValue, countryId],
        );
      }
    } catch (e) {
      print('Error occurred while updating country laws: $e');
    }
  }

  Future<void> updateResEffects(
      num changeValue, String attribute, String type, int countryId) async {
    final current = CreateNewGameController.to.currentSaveGame.value;
    final db = await DatabaseHelper.instance.currentDatabase(current);

    try {
      if (type == 'positif') {
        await db.rawUpdate(
          'UPDATE country_datas '
          'SET $attribute = $attribute + ?'
          'WHERE country_id = ?',
          [changeValue, countryId],
        );
      } else {
        await db.rawUpdate(
          'UPDATE country_datas '
          'SET $attribute = $attribute - ?'
          'WHERE country_id = ?',
          [changeValue, countryId],
        );
      }
    } catch (e) {
      print('Error occurred while updating country laws: $e');
    }
  }
  Future<void> updateDemandEffects(
      num changeValue, String attribute, String type, int countryId) async {
    final current = CreateNewGameController.to.currentSaveGame.value;
    final db = await DatabaseHelper.instance.currentDatabase(current);

    try {
      if (type == 'positif') {
        await db.rawUpdate(
          'UPDATE country_datas '
          'SET $attribute = $attribute + ?'
          'WHERE country_id = ?',
          [changeValue, countryId],
        );
      } else {
        await db.rawUpdate(
          'UPDATE country_datas '
          'SET $attribute = $attribute - ?'
          'WHERE country_id = ?',
          [changeValue, countryId],
        );
      }
    } catch (e) {
      print('Error occurred while updating country laws: $e');
    }
  }
}
