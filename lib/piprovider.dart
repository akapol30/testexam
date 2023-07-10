import 'package:example1/piclass.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class PIProvider {
  static const piTable = "PITable";
  static PIProvider instace = PIProvider();
  Future<Database> database() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'step.db'),
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
            "CREATE TABLE $piTable (id TEXT PRIMARY KEY,fullname TEXT , email TEXT,tel TEXT,address TEXT,done INTEGER)");
      },
    );
  }

  Future<List<PIItem>> fetchPI() async {
    Database db = await database();
    List<Map<dynamic, dynamic>> pi = await db.query(piTable);
    return pi.map((e) => PIItem.fromMap(e)).toList();
  }

  Future<void> insertPI(PIItem item) async {
    Database db = await database();
    await db.insert(piTable, item.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> deletePI(PIItem item) async {
    Database db = await database();
    await db.delete(piTable, where: "id = ?", whereArgs: [item.id]);
  }
}
