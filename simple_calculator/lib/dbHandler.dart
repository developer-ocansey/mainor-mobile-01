import 'package:simplecalculator/Transactions.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHandler {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'example.db'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE transactions(id INTEGER PRIMARY KEY AUTOINCREMENT, operation TEXT NOT NULL, timestamp TIMESTAMP)",
        );
      },
      version: 1,
    );
  }

  Future<int> insert(Transactions transaction) async {
    int result = 0;
    final Database db = await initializeDB();
    result = await db.insert('transactions', transaction.toMap());
    return result;
  }

  Future<List<Transactions>> get() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult =
        await db.query('transactions');
    return queryResult.map((e) => Transactions.fromMap(e)).toList();
  }

  Future<void> clear(int id) async {
    final db = await initializeDB();
    await db.delete(
      'transactions',
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
