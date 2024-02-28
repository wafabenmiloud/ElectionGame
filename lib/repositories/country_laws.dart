import 'package:gamev2/controllers/create_new_game_controller.dart';
import 'package:gamev2/models/country_laws_model.dart';

import 'package:gamev2/utils/constants.dart';
import 'package:gamev2/utils/database_helper.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class CountryLawsRepo {
  Future<List<CountryLawsModel>> getCountryLaws(int id) async {
    final current = CreateNewGameController.to.currentSaveGame.value;
    final db = await DatabaseHelper.instance.currentDatabase(current);
    try {
      final list = await db
          .rawQuery("SELECT * FROM country_laws where minister_id = ?", [id]);
      return list.map((e) => CountryLawsModel.fromMap(e)).toList();
    } catch (e) {
      print('Error occurred while fetching laws: $e');
      return <CountryLawsModel>[];
    }
  }

  Future<List<Map<String, dynamic>>> getParlmentLaws() async {
    final current = CreateNewGameController.to.currentSaveGame.value;
    final db = await DatabaseHelper.instance.currentDatabase(current);

    try {
      final currentDate = dateformat.format(DateTime.now());
      final list = await db.rawQuery(
        "SELECT parlements_laws.*, country_laws.* "
        "FROM parlements_laws "
        "JOIN country_laws ON parlements_laws.law_id = country_laws.id "
        "WHERE parlements_laws.voting_date >= ?",
        [currentDate],
      );
      return list;
    } catch (e) {
      print('Error occurred while fetching parlements laws: $e');
      return <Map<String, dynamic>>[];
    }
  }

  Future<void> insertParlementLaw(
      int lawId, String status, int defValue, int newDefValue) async {
    final current = CreateNewGameController.to.currentSaveGame.value;
    final db = await DatabaseHelper.instance.currentDatabase(current);
    final addedDate = dateformat.format(DateTime.now());

    try {
      // Fetch the most recent voting_date
      final List<Map<String, dynamic>> latestRecord = await db
          .query('parlements_laws', orderBy: 'voting_date DESC', limit: 1);

      String votingDate;
      if (latestRecord.isNotEmpty) {
        final DateTime mostRecentVotingDate =
            dateformat.parse(latestRecord[0]['voting_date']);
        final DateTime newVotingDate =
            mostRecentVotingDate.add(const Duration(days: 15));
        votingDate = dateformat.format(newVotingDate);
      } else {
        // If no records in the database, set a new voting date 15 days from now
        final DateTime newVotingDate =
            DateTime.now().add(const Duration(days: 15));
        votingDate = dateformat.format(newVotingDate);
      }

      // Insert the new record
      await db.insert(
        'parlements_laws',
        {
          'law_id': lawId,
          'new_value': newDefValue,
          'old_value': defValue,
          'true_voted': 0,
          'false_voted': 0,
          'neutral_value': 0,
          'status': status,
          'added_date': addedDate,
          'voting_date': votingDate,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      print('Error occurred while inserting or fetching parlements laws: $e');
    }
  }

  Future<bool> doesParlementLawExist(int lawId) async {
    final current = CreateNewGameController.to.currentSaveGame.value;
    final db = await DatabaseHelper.instance.currentDatabase(current);

    try {
      // Check if law_id already exists
      final existingRecords = await db.query(
        'parlements_laws',
        where: 'law_id = ?',
        whereArgs: [lawId],
        limit: 1,
      );
      if (existingRecords.isEmpty) {
        return false;
      }
      return true;
    } catch (e) {
      print('Error occurred while inserting or fetching parlements laws: $e');
      return true;
    }
  }

  Future<void> updateCountryLaws(
      int id, int defaultValue, int numberChangedSlice) async {
    final current = CreateNewGameController.to.currentSaveGame.value;
    final db = await DatabaseHelper.instance.currentDatabase(current);

    try {
      await db.rawUpdate(
        "UPDATE country_laws SET default_value = ?, number_changed_slice = ? WHERE id = ?",
        [defaultValue, numberChangedSlice.abs(), id],
      );
    } catch (e) {
      print('Error occurred while updating country laws: $e');
    }
  }

  Future<void> updateStrength(int id, int strength, int countryId) async {
    final current = CreateNewGameController.to.currentSaveGame.value;
    final db = await DatabaseHelper.instance.currentDatabase(current);

    try {
      if (strength < 0) {
        await db.rawUpdate(
          "UPDATE country_relations SET relationship_strength = 0 WHERE country1_id = ? AND country2_id = ? ",
          [countryId, id],
        );
      } else {
        await db.rawUpdate(
          "UPDATE country_relations SET relationship_strength = ? WHERE country1_id = ? AND country2_id = ? ",
          [strength, countryId, id],
        );
      }
    } catch (e) {
      print('Error occurred while updating data: $e');
    }
  }

  Future<void> insertDiplom(String embassy, String visa, String military,
      String commercial, int id) async {
    final current = CreateNewGameController.to.currentSaveGame.value;
    final db = await DatabaseHelper.instance.currentDatabase(current);

    try {
      await db.rawUpdate(
        "UPDATE diplomaties SET embassy_status = ?, visa_status = ?, military_status = ?, commercial_status = ? WHERE country_id = ?",
        [embassy, visa, military, commercial, id],
      );
    } catch (e) {
      print('Error occurred while updating country relations: $e');
    }
  }
}
