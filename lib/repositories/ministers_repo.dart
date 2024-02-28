import 'package:gamev2/controllers/create_new_game_controller.dart';
import 'package:gamev2/models/country_ministers_model.dart';
import 'package:gamev2/utils/database_helper.dart';

class CountryMinistersRepo {
  static const _table = 'country_ministers';

  Future<List<CountryMinisterModel>> getCountryMinisters(int countryId) async {
    final current = CreateNewGameController.to.currentSaveGame.value;
    final db = await DatabaseHelper.instance.currentDatabase(current);
    try {
      final list = await db
          .rawQuery("SELECT * FROM $_table WHERE country_id='$countryId'");
      final countryMinisters =
          list.map((e) => CountryMinisterModel.fromMap(e)).toList();

      return countryMinisters;
    } catch (e) {
      print('Error occurred while fetching country ministers: $e');
      return <CountryMinisterModel>[];
    }
  }

  Future<Map<String, int>> getMinisterFinancials(int ministerId) async {
    final current = CreateNewGameController.to.currentSaveGame.value;
    final db = await DatabaseHelper.instance.currentDatabase(current);

    try {
      final List<Map<String, dynamic>> result = await db.query(
        'country_ministers',
        columns: ['profits', 'expenses', 'incomes'],
        where: 'id = ?',
        whereArgs: [ministerId],
      );

      if (result.isNotEmpty) {
        final Map<String, int> financials = {
          'profits': result[0]['profits'] ?? 0,
          'expenses': result[0]['expenses'] ?? 0,
          'incomes': result[0]['incomes'] ?? 0,
        };
        return financials;
      } else {
        return {
          'profits': 0,
          'expenses': 0,
          'incomes': 0,
        };
      }
    } catch (e) {
      print('Error occurred while fetching minister financials: $e');
      return {
        'profits': 0,
        'expenses': 0,
        'incomes': 0,
      };
    }
  }
}
