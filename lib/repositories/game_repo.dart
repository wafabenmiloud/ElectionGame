import 'dart:io';
import 'dart:math';

import 'package:gamev2/models/country_model.dart';
import 'package:gamev2/models/current_game_model.dart';
import 'package:gamev2/models/election_model.dart';
import 'package:gamev2/models/games_model.dart';
import 'package:gamev2/models/person_model.dart';
import 'package:gamev2/models/president_model.dart';
import 'package:gamev2/models/president_promises_model.dart';
import 'package:gamev2/utils/constants.dart';
import 'package:gamev2/utils/database_helper.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class GameRepo {
  final _database = DatabaseHelper.instance.database;

  Future<int> insertPerson(PersonModel person) async {
    final db = await _database;
    try {

      return await db.insert('persons', person.toMap());
    } catch (e) {
      print('Error occurred while inserting person: $e');
      return -1;
    }
  }

  Future<void> insertPresident(PresidentModel president, Database db) async {
    try {
      await db.insert('presidents', president.toMap());
    } catch (e) {
      print('Error occurred while inserting president: $e');
    }
  }

  Future<void> insertElection(ElectionModel election, Database db) async {
    try {
      await db.insert('elections', election.toMap());
    } catch (e) {
      print('Error occurred while inserting election: $e');
    }
  }

  Future<void> insertPresidentPromise(
      PresidentPromisesModel presidentpromise, Database db) async {
    try {
      await db.insert('president_promises', presidentpromise.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    } catch (e) {
      print("Error inserting president promise: $e");
    }
  }

  Future<String> createNewGame({
    required isMale,
    required Rx<RxMap<String, dynamic>> concurrent,
    required List<PresidentPromisesModel> promiseModels,
    required CountryModel countryId,
    required PersonModel person,
  }) async {
    final db = await _database;
    const maxGames = 4;
    final gamesNumber = await db.rawQuery('SELECT * FROM games');
    if (gamesNumber.length > maxGames) {
      await db
          .rawQuery('DELETE FROM games WHERE id = (SELECT MIN(id) FROM games)');
    }
    const startingPoints = 50;
    final now = DateTime.now();
    final startingDate1 = DateFormat('HH_mm_ss_dd_MM_yy').format(now);
    final startingDate2 = dateformat.format(now);
    final nameDatabase =
        '${startingDate1}_${person.first_name}${person.last_name}';
    final game = GamesModel(
      current_date: startingDate2,
      my_country_id: countryId.id,
      name_database_game: nameDatabase,
      points: startingPoints,
    );
    await db.insert('games', game.toMap());


    final directory = await getApplicationDocumentsDirectory();
    final sourceFile = File(
        '${directory.path}${Platform.pathSeparator}PresidentCareer${Platform.pathSeparator}database.db');
    final destinationDir = Directory(
        '${directory.path}${Platform.pathSeparator}PresidentCareer${Platform.pathSeparator}Games');
    await destinationDir.create(recursive: true);
    final destinationFile =
        File('${destinationDir.path}${Platform.pathSeparator}$nameDatabase.db');
    await sourceFile.copy(destinationFile.path);

    final newDb = await databaseFactoryFfi.openDatabase(destinationFile.path);

    final personId = await insertPerson(person);
    for (final promise in promiseModels) {
      await insertPresidentPromise(promise,newDb);
    }

    DateTime endDate =
        dateformat.parse(startingDate2).add(const Duration(days: 3));
    final president = PresidentModel(
      person_id: personId,
      end_mandat_date: dateformat.format(endDate),
    );
    await insertPresident(president,newDb);

    int generateRandomInt(int min, int max) {
      return Random().nextInt(max - min) + min;
    }
    int res = generateRandomInt(51, 65);
    final election = ElectionModel(
      person_me_id: personId,
      person_opponent_id: concurrent.value['candidate'].person_id,
      country_id: person.country_id,
      result_person_me: res,
      result_person_opponent: 100 - res,
      date: dateformat.format(DateTime.now()),
    );
    await insertElection(election,newDb);

    final currentGame = CurrentGameModel(
      me_id: personId,
      country_flag_img_path: countryId.flag_img_path,
      president_image_path: person.image_path,
      country_name: countryId.name,
      country_id: countryId.id,
      points: startingPoints,
      current_date: dateformat.format(DateTime.now()),
      birth_date: person.birth_date,
      my_name: person.first_name + person.last_name,
      first_name: person.first_name,
      last_name: person.last_name,
      gender: isMale,
      end_mandat: dateformat.format(endDate),
      start_date: startingDate2,
    );
    await newDb.insert('current_game', currentGame.toMap());
    return nameDatabase;
  }

  Future<List<GamesModel>> loadSavedGames() async {
    final db = await _database;
    try {
      final list = await db.rawQuery('SELECT * FROM games');
      return list.map((e) => GamesModel.fromMap(e)).toList();
    } catch (e) {
      return [];
    }
  }
}
