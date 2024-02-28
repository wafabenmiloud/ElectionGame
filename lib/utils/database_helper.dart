import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common/sqlite_api.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();
  Future<Database> currentDatabase(String saveGameName) async =>
      await _getDatabase(saveGameName);

  Future<Database> _initDatabase() async {
    final directory = await getApplicationDocumentsDirectory();
    final dbPath = '${directory.path}/PresidentCareer/database.db';
    Database db;
    try {
      db = await databaseFactoryFfi.openDatabase(dbPath);
      // To test if database have data
      await db.rawQuery('SELECT * FROM countries');
    } catch (e) {
      final data = await rootBundle.load('assets/initdatabase.db');
      final bytes = data.buffer.asUint8List();
      final file = File(dbPath);
      await file.writeAsBytes(bytes);
      db = await databaseFactoryFfi.openDatabase(dbPath);
    }

    return db;
  }

 Future<Database> _getDatabase(String saveGameName) async {
  final directory = await getApplicationDocumentsDirectory();
  final dbPath = '${directory.path}/PresidentCareer/Games/$saveGameName.db';
  final db = await databaseFactoryFfi.openDatabase(dbPath);
  return db;
}

}