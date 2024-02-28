import 'package:gamev2/controllers/create_new_game_controller.dart';
import 'package:gamev2/utils/database_helper.dart';
import '../models/president_promises_model.dart';

class PresidentPromisesRepo {

  Future<List<Map<String, dynamic>>> getPresidentPromises(int countryId) async {
    final current = CreateNewGameController.to.currentSaveGame.value;
    final db = await DatabaseHelper.instance.currentDatabase(current);
    try {
      final list = await db.rawQuery(
        "SELECT president_promises.*, promises.id AS promise_id, promises.* FROM president_promises JOIN promises ON president_promises.promise_id = promises.id WHERE president_promises.country_id = ?",
        [countryId],
      );
      return list;
    } catch (e) {
      return [];
    }
  }
}
