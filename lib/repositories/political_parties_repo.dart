import 'package:gamev2/controllers/create_new_game_controller.dart';
import 'package:gamev2/models/person_model.dart';
import 'package:gamev2/utils/database_helper.dart';

class PoliticalPartiesRepo {
  final _database = DatabaseHelper.instance.database;

  Future<List<PersonModel>> getMembersData(int id) async {
       final db = await _database;

    try {
      final list = await db
          .rawQuery("SELECT * FROM persons where political_party_id = ?", [id]);

      return list.map((e) => PersonModel.fromMap(e)).toList();
    } catch (e) {
      print('Error occurred while fetching debate responses: $e');
      return <PersonModel>[];
    }
  }

  Future<List<Map<String, dynamic>>> getPoliticalPartiesAndPersons(
      int id) async {
    final db = await _database;
    try {
      final list = await db.rawQuery(
          "SELECT political_parties.*, persons.id AS person_id, persons.* FROM political_parties JOIN persons ON political_parties.director_id = persons.id where political_parties.country_id=$id");
      return list;
    } catch (e) {
      print('Error occurred while fetching political parties and persons: $e');

      return <Map<String, dynamic>>[];
    }
  }

  Future<int> getMembers(int id) async {
    final db = await _database;

    try {
      final result = await db.rawQuery(
          "SELECT COUNT(*) as count FROM persons WHERE political_party_id = ?",
          [id]);
      if (result.isNotEmpty) {
        final count = result.first['count'] as int;
        return count;
      } else {
        return 0;
      }
    } catch (e) {
      print('Error occurred while fetching party members count: $e');
      return -1;
    }
  }
}
