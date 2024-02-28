import 'package:gamev2/controllers/create_new_game_controller.dart';
import 'package:gamev2/models/news_model.dart';
import 'package:gamev2/utils/database_helper.dart';

class PresidentialAdvisorDemandsRepo {
  Future<List<Map<String, dynamic>>> getDemands(int countryId) async {
    final current = CreateNewGameController.to.currentSaveGame.value;
    final db = await DatabaseHelper.instance.currentDatabase(current);
    try {
      final result = await db.rawQuery(
        "SELECT presidential_advisor_current_demand.*, "
        "presidential_advisor_demands.id AS presidential_advisor_demands_id, "
        "presidential_advisor_demands.* "
        "FROM presidential_advisor_current_demand "
        "JOIN presidential_advisor_demands ON presidential_advisor_current_demand.demand_id = presidential_advisor_demands.id "
        "WHERE presidential_advisor_current_demand.country_id = ? AND presidential_advisor_current_demand.is_accomplished = 0 ",
        [countryId],
      );
      return result;
    } catch (e) {
      print('Error occurred while fetching news: $e');
      return [];
    }
  }
  Future<void> updateDemandStatus(
      int demandId) async {
    final current = CreateNewGameController.to.currentSaveGame.value;
    final db = await DatabaseHelper.instance.currentDatabase(current);

    try {
      await db.rawUpdate(
          'UPDATE presidential_advisor_current_demand '
          'SET is_accomplished = 1 '
          'WHERE id = ?',
          [demandId],
        );
    } catch (e) {
      print('Error occurred while updating country laws: $e');
    }
  }
 }
