import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseManager {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'app.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('PRAGMA foreign_keys = ON');

        await db.execute('''
          CREATE TABLE kasir (
            id INTEGER PRIMARY KEY,
            nama TEXT NOT NULL,
            noHp TEXT,
            pin TEXT NOT NULL,
            role TEXT NOT NULL
          )
        ''');

      
        final count = Sqflite.firstIntValue(
            await db.query('kasir', columns: ['COUNT(*)']));

        if (count == 0) {
          await db.insert('kasir', {
            'nama': 'Owner',
            'pin': '123456',
            'role': 'owner'
          });
        }
      },
    );
  }

  Future<void> closeDatabase() async {
    if (_database != null) {
      await _database!.close();
      _database = null;
    }
  }
}