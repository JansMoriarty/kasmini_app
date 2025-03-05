import 'package:kasmini_app/data/models/kasir_model.dart';
import 'package:kasmini_app/domain/entities/kasir.dart';
import 'package:sqflite/sqflite.dart';

class KasirLocalDataSource {
  final Database database;

  KasirLocalDataSource(this.database);

  Future<List<Kasir>?> getAllKasir([Map<String, dynamic>? filter]) async {
    try {
      String? whereClause;
      List<dynamic>? whereArgs;

      if (filter != null && filter.isNotEmpty) {
        final conditions = filter.entries.map((entry) => '${entry.key} = ?');
        whereClause = conditions.join(' AND ');
        whereArgs = filter.values.toList();
      }

      final query = await database.query(
        Kasir.tableName,
        where: whereClause,
        whereArgs: whereArgs,
      );

      if (query.isEmpty) {
        return null;
      }

      return query.map((kasir) => KasirModel.fromMap(kasir)).toList();
    } catch (e) {
      print('Error KasirLocalDataSource getAllKasir: ${e.toString()}');
      return null;
    }
  }

  Future<Kasir?> getKasirById([Map<String, dynamic>? filter]) async {
    try {
      String? whereClause;
      List<dynamic>? whereArgs;

      if (filter != null && filter.isNotEmpty) {
        final conditions = filter.entries.map((entry) => '${entry.key} = ?');
        whereClause = conditions.join(' AND ');
        whereArgs = filter.values.toList();
      }

      final query = await database.query(
        Kasir.tableName,
        where: whereClause,
        whereArgs: whereArgs,
        limit: 1,
      );

      if (query.isEmpty) {
        return null;
      }

      return KasirModel.fromMap(query.first);
    } catch (e) {
      print('Error KasirLocalDataSource getAllKasir: ${e.toString()}');
      return null;
    }
  }

  Future<void> addKasir(Kasir newKasir) async {
    try {
      final kasirModel = KasirModel(
        id: newKasir.id,
        nama: newKasir.nama,
        noHp: newKasir.noHp,
        pin: newKasir.pin,
        role: newKasir.role,
      );

      await database.insert(
        Kasir.tableName,
        kasirModel.toMap(),
      );
    } catch (e) {
      print('Error KasirLocalDataSource addKasir: ${e.toString()}');
    }
  }

  Future<void> updateKasir(Kasir kasir) async {
    try {
      final kasirModel = KasirModel(
        id: kasir.id,
        nama: kasir.nama,
        noHp: kasir.noHp,
        pin: kasir.pin,
        role: kasir.role,
        foto: kasir.foto,
      );

      await database.update(
        Kasir.tableName,
        kasirModel.toMap(),
        where: 'id = ?',
        whereArgs: [kasir.id],
      );
    } catch (e) {
      print('Error KasirLocalDataSource updateKasir: ${e.toString()}');
    }
  }

  Future<void> deleteKasir(int id) async {
    try {
      await database.delete(
        Kasir.tableName,
        where: 'id = ?',
        whereArgs: [id],
      );
    } catch (e) {
      print('Error KasirLocalDataSource deleteKasir: ${e.toString()}');
    }
  }
}
