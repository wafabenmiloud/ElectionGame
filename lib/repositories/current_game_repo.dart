import 'package:gamev2/models/current_game_model.dart';
import 'package:gamev2/utils/constants.dart';
import 'package:gamev2/utils/database_helper.dart';

import '../controllers/create_new_game_controller.dart';
import 'package:intl/intl.dart';

class CurrentGameRepo {
  static const _table = 'current_game';

  Future<CurrentGameModel> getCurrentGame() async {
    final current = CreateNewGameController.to.currentSaveGame.value;
    final db = await DatabaseHelper.instance.currentDatabase(current);
    try {
      final list = await db.rawQuery("SELECT * FROM $_table");
      final currentGame = list.map((e) => CurrentGameModel.fromMap(e)).toList();

      if (currentGame.isNotEmpty) {
        final currentModel = currentGame[0];
        return currentModel;
      } else {
        throw Exception('Current game not found');
      }
    } catch (e) {
      print('Error occurred while fetching current game: $e');

      rethrow;
    }
  }

  Future<void> updatePoints(
      int currentGameId, int numberSlices, int pointsSlice) async {
    final current = CreateNewGameController.to.currentSaveGame.value;
    final db = await DatabaseHelper.instance.currentDatabase(current);
    try {
      await db.rawUpdate(
        'UPDATE $_table SET points = points - (? * ?) WHERE id = ?',
        [numberSlices.abs(), pointsSlice, currentGameId],
      );
    } catch (e) {
      print('Error occurred while updating points: $e');
    }
  }

  Future<void> nextRound(int countryid, int gameid) async {
    final current = CreateNewGameController.to.currentSaveGame.value;
    final db = await DatabaseHelper.instance.currentDatabase(current);

    try {
      final currentDateResult =
          await db.rawQuery("SELECT * FROM current_game WHERE id= ?", [gameid]);

      if (currentDateResult.isNotEmpty) {
        String currentDateString =
            currentDateResult[0]['current_date'] as String;
        DateTime currentDate = DateTime.parse(currentDateString);
        currentDate = currentDate.add(Duration(days: 1));
        String updatedDate = currentDate.toIso8601String().split('T')[0];

        await db.rawUpdate('''
    UPDATE $_table
    SET current_date = ?
    WHERE id = ?
  ''', [updatedDate, gameid]);
      } else {
        print('No data found in current_game table');
      }

      await db.rawUpdate('''
      UPDATE country_datas
      SET
        population_number = population_number + population_number_per_round,
        pollution_taux = pollution_taux + pollution_taux_per_round,
        security_taux = security_taux + security_taux_per_round,
        education_taux = education_taux + education_taux_per_round,
        healthy_taux = healthy_taux + healthy_taux_per_round,
        total_economy_amount = total_economy_amount + total_economy_amount_per_round,
        stability_int_taux = stability_int_taux + stability_int_taux_per_round,
        stability_international_taux = stability_international_taux + stability_international_taux_per_round,
        justicy_taux = justicy_taux + justicy_taux_per_round,
        pib_amount = pib_amount + pib_amount_per_round
        where country_id = ? OR country_id IS NOT ?
    ''', [countryid, countryid]);

      await db.rawUpdate('''
      UPDATE country_resources
      SET
        total_quantity = 10 * number_of_companies *
                        (CASE WHEN company_size = 'S' THEN 1
                              WHEN company_size = 'M' THEN 5
                              WHEN company_size = 'L' THEN 10
                              ELSE 0  -- Default value or handle as needed
                          END) * production_coifficient 
                          where country_id = ? OR country_id IS NOT ?
    ''', [countryid, countryid]);
    } catch (e) {
      print('Error occurred while updating country datas: $e');
    }
  }
}
