import 'package:gamev2/controllers/create_new_game_controller.dart';
import 'package:gamev2/utils/database_helper.dart';
import '../models/election_model.dart';

class ElectionsRepo {

  static const _table = 'elections';

 Future<List<ElectionModel>> getElections(int id) async {
     final current = CreateNewGameController.to.currentSaveGame.value;
    final db = await DatabaseHelper.instance.currentDatabase(current);
try {

    final list = await db.rawQuery("SELECT * FROM $_table where country_id = $id");
    final elections = list.map((e) => ElectionModel.fromMap(e)).toList();

    return elections;
  } catch (e) {
    print('Error occurred while fetching elections: $e');
    return <ElectionModel>[];
  }
}

}
