import 'package:free_dicionary/app/models/favorite_model.dart';
import 'package:free_dicionary/app/models/history_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

import '../models/progress_model.dart';

class DatabaseService {
  static Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await startDb();
    return _db!;
  }

  Future<String> get _path async {
    return path.join(await getDatabasesPath(), 'words.db');
  }

  Future<Database> startDb() async {
    String dbPath = await _path;

    Database db = await openDatabase(
      dbPath,
      version: 1,
      onCreate: _onCreate,
    );
    return db;
  }

  Future<void> deleteDB() async {
    String path = await _path;
    await deleteDatabase(path);
  }

  Future<void> deleteTables() async {
    String path = await _path;

    Database database = await openDatabase(path, version: 1);

    await database.execute('DELETE FROM favorites');

    await database.execute('DELETE FROM history');

    await database.execute('DELETE FROM progress');
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
    await db.execute('''
      CREATE TABLE progress(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        value REAL,
        click INTEGER        
      )
      ''');
  }

  Future<void> inserterProgres(double value, int click) async {
    final db = await database;
    await db.rawInsert(
      'INSERT OR REPLACE INTO progress (id, value, click) VALUES (?, ?, ?)',
      [1, value, click],
    );
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

  Future<ProgressModel> getProgress() async {
    final db = await database;
    final List<Map<String, dynamic>> maps =
        await db.query('progress', orderBy: 'id DESC', limit: 1);
    if (maps.isNotEmpty) {
      return ProgressModel.fromJson(maps.first);
    }
    return ProgressModel(value: 0.0, click: 0);
  }
}
