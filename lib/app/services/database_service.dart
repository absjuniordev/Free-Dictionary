import 'package:free_dicionary/app/models/favorite_model.dart';
import 'package:free_dicionary/app/models/history_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class DatabaseService {
  static Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await startDb();
    return _db!;
  }

  Future<Database> startDb() async {
    String pathDb = path.join(await getDatabasesPath(), 'words.db');

    Database db = await openDatabase(
      pathDb,
      version: 1,
      onCreate: _onCreate,
    );
    return db;
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE favorites(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        word TEXT
      )
      ''');
    await db.execute('''
      CREATE TABLE history(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        word TEXT,
        date TEXT
      )
      ''');
  }

  Future<void> insertHistory(HistoryModel favorite) async {
    final db = await database;
    await db.insert(
      'history',
      favorite.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<HistoryModel>> getHistory() async {
    final db = await database;
    final List<Map<String, dynamic>> maps =
        await db.query('history', orderBy: 'date DESC');

    return List.generate(maps.length, (i) {
      return HistoryModel.fromMap(maps[i]);
    });
  }

  Future<void> insertFavorite(FavoriteModel history) async {
    final db = await database;
    await db.insert(
      'favorites',
      history.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deleteFavorite(String word) async {
    final db = await database;
    await db.delete(
      'favorites',
      where: 'word = ?',
      whereArgs: [word],
    );
  }

  Future<List<FavoriteModel>> getFavorites() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('favorites');

    return List.generate(maps.length, (i) {
      return FavoriteModel.fromMap(maps[i]);
    });
  }
}
