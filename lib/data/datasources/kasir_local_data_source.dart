import 'package:kasmini_app/data/models/kasir_model.dart';
import 'package:kasmini_app/domain/entities/kasir.dart';
import 'package:sqflite/sqflite.dart';

class KasirLocalDataSource {
  final Database database;

  KasirLocalDataSource(this.database);

  Future<List<Kasir>?> getAllKasir({Map<String, dynamic> filter = const {}}) async {
    String whereClause = '';
    List<dynamic> whereArgs = [];

    if (filter.isNotEmpty) {
      filter.forEach((key, value) {
        whereClause += whereClause.isEmpty ? '$key = ?' : ' AND $key = ?';
        whereArgs.add(value);
      });
    }

    final query = await database.query(
      'kasir',
      where: whereClause,
      whereArgs: whereArgs,
    );

    if (query.isEmpty) {
      return null;
    }

    return query.map((kasir) => KasirModel.fromMap(kasir)).toList();
  }

  Future<Kasir?> getKasir({Map<String, dynamic> filter = const {}}) async {
    String whereClause = '';
    List<dynamic> whereArgs = [];

    if (filter.isNotEmpty) {
      filter.forEach((key, value) {
        whereClause += whereClause.isEmpty ? '$key = ?' : ' AND $key = ?';
        whereArgs.add(value);
      });
    }

    final query = await database.query(
      'kasir',
      where: whereClause,
      whereArgs: whereArgs,
      limit: 1,
    );

    if (query.isEmpty) {
      return null;
    }

    return KasirModel.fromMap(query.first);
  }

  Future<void> addKasir(Kasir newKasir) async {
    final kasirModel = KasirModel(
      id: newKasir.id,
      nama: newKasir.nama,
      noHp: newKasir.noHp,
      pin: newKasir.pin,
      role: newKasir.role,
    );

    await database.insert(
      'kasir',
      kasirModel.toMap(),
    );
  }

  Future<void> updateKasir(Kasir kasir) async {
    final kasirModel = KasirModel(
      id: kasir.id,
      nama: kasir.nama,
      noHp: kasir.noHp,
      pin: kasir.pin,
      role: kasir.role,
    );

    await database.update(
      'kasir',
      kasirModel.toMap(),
      where: 'id = ?',
      whereArgs: [kasir.id],
    );
  }

  Future<void> deleteKasir(int id) async {
    await database.delete(
      'kasir',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
