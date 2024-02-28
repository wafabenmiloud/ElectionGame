
import 'package:gamev2/models/promise_model.dart';
import 'package:gamev2/utils/database_helper.dart';

class PromisesRepo {
  final _database = DatabaseHelper.instance.database;

  Future<List<PromiseModel>> getPromises() async {
    final db = await _database;
    try {
      final list = await db.rawQuery("SELECT * FROM promises");

      return list.map((e) => PromiseModel.fromMap(e)).toList();
    } catch (e) {
      print('Error occurred while fetching promises: $e');
      return <PromiseModel>[];
    }
  }
}
