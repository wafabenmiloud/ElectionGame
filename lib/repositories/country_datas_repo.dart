import 'package:gamev2/controllers/create_new_game_controller.dart';
import 'package:gamev2/models/country_datas_model.dart';
import 'package:gamev2/utils/database_helper.dart';

class CountryDatasRepo {
  Future<List<CountryDatasModel>> getCountryDatas(int countryId) async {
    final current = CreateNewGameController.to.currentSaveGame.value;
    final db = await DatabaseHelper.instance.currentDatabase(current);
    try {
      final list = await db.rawQuery(
          "SELECT * FROM country_datas WHERE country_id ='$countryId'");
      final countryDatas =
          list.map((e) => CountryDatasModel.fromMap(e)).toList();

      return countryDatas;
    } catch (e) {
      print('Error occurred while fetching country datas: $e');
      return <CountryDatasModel>[];
    }
  }


  Future<int> getPibRanking(int countryId) async {
    final current = CreateNewGameController.to.currentSaveGame.value;
    final db = await DatabaseHelper.instance.currentDatabase(current);

    final List<Map<String, dynamic>> result = await db.rawQuery('''
      SELECT country_id, pib_amount FROM country_datas
      ORDER BY pib_amount DESC
    ''');

    int rank = 1;
    for (final Map<String, dynamic> row in result) {
      if (row['country_id'] == countryId) {
        return rank;
      }
      rank++;
    }
    return -1;
  }

  Future<List<Map<String, dynamic>>> getCountryDebts() async {
    final current = CreateNewGameController.to.currentSaveGame.value;
    final db = await DatabaseHelper.instance.currentDatabase(current);
    try {
      final result = await db.rawQuery('''
        SELECT
          total_amount - total_refunded AS debt_remaining,
          name, flag_img_path
        FROM country_debts
        JOIN countries  ON countries.id = country_debts.borrower_country_id ORDER BY debt_remaining DESC
      ''');

      return result;
    } catch (e) {
      print('Error occurred while fetching country details: $e');
      return [];
    }
  }
  Future<List<Map<String, dynamic>>> getCountryPIB() async {
    final current = CreateNewGameController.to.currentSaveGame.value;
    final db = await DatabaseHelper.instance.currentDatabase(current);
    try {
      final result = await db.rawQuery('''
        SELECT pib_amount, 
          name, flag_img_path
          
        FROM country_datas
        JOIN countries  ON countries.id = country_datas.country_id order by pib_amount DESC
      ''');

      return result;
    } catch (e) {
      print('Error occurred while fetching country details: $e');
      return [];
    }
  }
}
