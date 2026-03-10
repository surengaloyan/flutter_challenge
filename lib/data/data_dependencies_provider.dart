import 'package:flutter_challenge/data/auth/data_source/auth_local_data_source.dart';
import 'package:flutter_challenge/data/database/database_creator.dart';
import 'package:get_it/get_it.dart';

class DataDependenciesProvider {
  DataDependenciesProvider({required GetIt di}) : _di = di;

  final GetIt _di;

  Future<void> initialize() async {
    final database = await DatabaseCreator.initDatabase();

    _di
      ..registerSingleton(database)
      ..registerLazySingleton<AuthLocalDataSource>(
        () => AuthLocalDataSource(database: _di()),
      );
  }
}
