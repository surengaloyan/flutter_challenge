import 'package:flutter_challenge/data/database/initial_scripts.dart';
import 'package:sqflite/sqflite.dart';

abstract class DatabaseCreator {
  static Future<Database> initDatabase() async {
    final databasePath = await getDatabasePath(dbName: 'challenge_database');
    final database = openDatabase(
      databasePath,
      version: 1,
      onCreate: _executeInitialScripts,
    );

    return database;
  }

  static Future<String> getDatabasePath({required String dbName}) async {
    final databasePath = await getDatabasesPath();

    return '$databasePath/$dbName';
  }

  static Future<void> _executeInitialScripts(
    Database database,
    int version,
  ) async {
    for (var script in initialScripts) {
      await database.execute(script);
    }
  }
}
