import 'package:inputexpense/crudnew/sql/datamodel.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DB1 {
  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, "MYDB.db"),
      onCreate: (database, version) async {
        await database.execute("""
        CREATE TABLE MYTable(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT NOT NULL,
          subtitle TEXT NOT NULL
        )
        """);
      },
      version: 1,
    );
  }

  Future<bool> insertData(DataModel dataModel) async {
    final Database db = await initDB();
    db.insert("MYTable", dataModel.toMap());
    return true;
  }

  Future<List<DataModel>> getData() async {
    final Database db = await initDB();
    final List<Map<String, Object?>> datas = await db.query("MYTable");
    return datas.map((e) => DataModel.fromMap(e)).toList();
  }

  Future<void> update(DataModel dataModel, int id) async {
    final Database db = await initDB();
    await db
        .update("MYTable", dataModel.toMap(), where: "id=?", whereArgs: [id]);
  }

  Future<void> delete(int id) async {
    final Database db = await initDB();
    await db.delete("MYTable", where: "id=?", whereArgs: [id]);
  }
}
