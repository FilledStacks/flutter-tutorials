import 'package:sqflite/sqflite.dart';
import 'package:sqflite_migration_example/app/locator.dart';
import 'package:sqflite_migration_example/models/todo.dart';
import 'package:sqflite_migration_service/sqflite_migration_service.dart';

const String DB_NAME = 'todo_database.sqlite';

const String TodoTableName = 'todos';

class DatabaseService {
  final _migrationService = locator<DatabaseMigrationService>();

  Database _database;
  Future initialise() async {
    _database = await openDatabase(DB_NAME, version: 1);

    await _migrationService.runMigration(
      _database,
      migrationFiles: [
        '1_create_schema.sql',
        '2_add_description.sql',
      ],
      verbose: true,
    );
  }

  Future<List<Todo>> getTodos() async {
    // Get all the data from the TodoTableName
    List<Map> todoResults = await _database.query(TodoTableName);
    // Map data to a Todo object
    return todoResults.map((todo) => Todo.fromJson(todo)).toList();
  }

  Future addTodo({String title, String description}) async {
    try {
      await _database.insert(
        TodoTableName,
        Todo(
          title: title,
          description: description,
        ).toJson(),
      );
    } catch (e) {
      print('Could not insert the todo: $e');
    }
  }

  Future updateCompleteForTodo({int id, bool complete}) async {
    try {
      await _database.update(
        TodoTableName,
        // We only pass in the data we want to update.
        // The field used here already has to exist in the schema
        {'complete': complete ? 1 : 0},
        where: 'id = ?',
        whereArgs: [id],
      );
    } catch (e) {
      print('Could not update the todo with id:$id. $e');
    }
  }
}
