import 'dart:developer';

import 'package:flutter_challenge/data/auth/data_source/auth_data_source.dart';
import 'package:flutter_challenge/data/database/database_constants.dart';
import 'package:sqflite/sqflite.dart';

class AuthLocalDataSource extends AuthDataSource {
  AuthLocalDataSource({required Database database}) : _database = database;

  final Database _database;

  @override
  Future<bool> login({
    required String username,
    required String password,
  }) async {
    try {
      final query =
          '''
            SELECT ${DatabaseConstants.username}
            FROM ${DatabaseConstants.usersTable}
            WHERE ${DatabaseConstants.username} = ? 
            AND ${DatabaseConstants.password} = ?
          ''';

      final result = await _database.rawQuery(query, [username, password]);

      return result.first['username'] != null;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> logout() async {
    try {
      final query =
          '''
            UPDATE ${DatabaseConstants.usersTable}
            SET ${DatabaseConstants.isActive} = 0 
            WHERE ${DatabaseConstants.isActive} = 1 
          ''';

      await _database.execute(query);

      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<String?> getActiveUsername() async {
    try {
      final query =
          '''
            SELECT ${DatabaseConstants.username}
            FROM ${DatabaseConstants.usersTable} 
            WHERE ${DatabaseConstants.isActive} = 1 
          ''';
      final result = await _database.rawQuery(query);

      log('response =>>>>>> $result');
      return result.first['username'].toString();
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool> signup({
    required String email,
    required String username,
    required String password,
  }) async {
    try {
      final query =
          '''
          INSERT INTO ${DatabaseConstants.usersTable}(
            ${DatabaseConstants.email},
            ${DatabaseConstants.username},
            ${DatabaseConstants.password},
            ${DatabaseConstants.isActive}
          )
          VALUES(?, ?, ?, ?)
        ''';

      await _database.rawInsert(query, [email, username, password, 1]);

      return true;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
