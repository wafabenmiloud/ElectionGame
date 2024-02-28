import 'package:gamev2/controllers/create_new_game_controller.dart';
import 'package:gamev2/models/country_debts_model.dart';
import 'package:gamev2/utils/constants.dart';
import 'package:gamev2/utils/database_helper.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class CountryDebtsRepo {
  final _database = DatabaseHelper.instance.database;
  final table = 'country_debts';
  Future<int> getDettes(int countryId) async {
    final db = await _database;

    try {
      final dettes = await db.rawQuery(
          "SELECT (total_amount - total_refunded) AS debt_remaining FROM $table WHERE borrower_country_id = $countryId AND is_finish = 0");
      if (dettes.isNotEmpty) {
        final debtRemaining = dettes.first['debt_remaining'] as int;
        return debtRemaining;
      } else {
        return -1;
      }
    } catch (e) {
      print('Error occurred while fetching debt: $e');
      return -1;
    }
  }
   Future<void> insertDebt(int countryId, int orgId, num loan, int years) async {
    final current = CreateNewGameController.to.currentSaveGame.value;
    final db = await DatabaseHelper.instance.currentDatabase(current);

    final addedDate = dateformat.format(DateTime.now());
    final endDate =
        dateformat.format(DateTime.now().add(Duration(days: (years * 365))));

    try {
      await db.insert(
        'country_debts',
        {
          'borrower_country_id': countryId,
          'lender_type': 'ORGA',
          'lender_id': orgId,
          'total_amount': loan,
          'total_refunded': 0,
          'days_number': years * 365,
          'days_remaining': years * 365,
          'start_date': addedDate,
          'end_date': endDate,
          'refund_amount_per_round': (loan / (years * 365)).round(),
          'is_finish': 0,
          'is_granted': 0,
          'debt_status':'WAITING'
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      print('Error occurred while inserting into parlements_laws: $e');
    }
  }

  Future<List<CountryDebtsModel>> getDebts(int id) async {
    final current = CreateNewGameController.to.currentSaveGame.value;
    final db = await DatabaseHelper.instance.currentDatabase(current);
    try {
      final list = await db.rawQuery(
          "SELECT * FROM country_debts where borrower_country_id = $id AND is_finish = 0 ORDER BY id DESC");

      return list.map((e) => CountryDebtsModel.fromMap(e)).toList();
    } catch (e) {
      print('Error occurred while fetching debts: $e');
      return <CountryDebtsModel>[];
    }
  }

}
