import 'package:free_dicionary/app/models/favorite_model.dart';
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

  Future<void> insertFavorite(FavoriteModel favorite) async {
    final db = await _db;
    await db.insert(
      'favorites',
      favorite.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
