import 'package:gamev2/controllers/create_new_game_controller.dart';
import 'package:gamev2/utils/database_helper.dart';
import '../models/job_model.dart';

class JobsRepo {
  static const _table = 'jobs';

  Future<String> getJobById(int id) async {
    final current = CreateNewGameController.to.currentSaveGame.value;
    final db = await DatabaseHelper.instance.currentDatabase(current);
    try {
      final result =
          await db.rawQuery("SELECT name FROM $_table WHERE id = ?", [id]);

      if (result.isNotEmpty) {
        final name = result.first['name'] as String;
        return name;
      } else {
        return '';
      }
    } catch (e) {
      return 'error fetching job : $e';
    }
  }
}
