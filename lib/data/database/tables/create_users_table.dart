import 'package:flutter_challenge/data/database/database_constants.dart';

const createUsersTable =
    '''
  CREATE TABLE ${DatabaseConstants.usersTable}
  (
    ${DatabaseConstants.email} TEXT PRIMARY KEY NOT NULL,
    ${DatabaseConstants.username} TEXT NOT NULL,
    ${DatabaseConstants.password} TEXT NOT NULL,
    ${DatabaseConstants.isActive} INTEGER DEFAULT 1
  )
''';
