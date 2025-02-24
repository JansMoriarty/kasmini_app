import 'package:kasmini_app/data/models/cashflow_model.dart';
import 'package:kasmini_app/domain/entities/cashflow.dart';
import 'package:sqflite/sqflite.dart';

class CashflowLocalDataSource {
  final Database database;

  CashflowLocalDataSource(this.database);

  Future<List<Cashflow>?> getAllCashflow(
      {Map<String, dynamic> filter = const {}}) async {
    try {
      String? whereClause;
      List<dynamic>? whereArgs;

      if (filter.isNotEmpty) {
        final conditions = filter.entries.map((entry) => '${entry.key} = ?');
        whereClause = conditions.join(' AND ');
        whereArgs = filter.values.toList();
      }

      final query = await database.query(
        Cashflow.tableName,
        where: whereClause,
        whereArgs: whereArgs,
      );

      if (query.isEmpty) {
        return null;
      }

      return query.map((cashflow) => CashflowModel.fromMap(cashflow)).toList();
    } catch (e) {
      print('Error CashflowLocalDataSource getAllKasir: ${e.toString()}');
      return null;
    }
  }

  Future<Cashflow?> getCashflow(
      {Map<String, dynamic> filter = const {}}) async {
    try {
      String whereClause = '';
      List<dynamic> whereArgs = [];

      if (filter.isNotEmpty) {
        filter.forEach((key, value) {
          whereClause += whereClause.isEmpty ? '$key = ?' : ' AND $key = ?';
          whereArgs.add(value);
        });
      }

      final query = await database.query(
        Cashflow.tableName,
        where: whereClause,
        whereArgs: whereArgs,
        limit: 1,
      );

      if (query.isEmpty) {
        return null;
      }

      return CashflowModel.fromMap(query.first);
    } catch (e) {
      print('Error CashflowLocalDataSource getAllKasir: ${e.toString()}');
      return null;
    }
  }

  Future<void> addCashflow(Cashflow newCashflow) async {
    try {
      final CashflowModel cashflowModel = CashflowModel(
        id: newCashflow.id,
        kasirId: newCashflow.kasirId,
        judul: newCashflow.judul,
        catatan: newCashflow.catatan,
        nominal: newCashflow.nominal,
        tanggal: newCashflow.tanggal,
        tipe: newCashflow.tipe,
      );

      await database.insert(
        Cashflow.tableName,
        cashflowModel.toMap(),
      );
    } catch (e) {
      print('Error CashflowLocalDataSource addKasir: ${e.toString()}');
    }
  }

  Future<void> updateCashflow(Cashflow cashflow) async {
    try {
      final CashflowModel cashflowModel = CashflowModel(
        id: cashflow.id,
        kasirId: cashflow.kasirId,
        judul: cashflow.judul,
        catatan: cashflow.catatan,
        nominal: cashflow.nominal,
        tanggal: cashflow.tanggal,
        tipe: cashflow.tipe,
      );

      await database.update(
        Cashflow.tableName,
        cashflowModel.toMap(),
        where: 'id = ?',
        whereArgs: [cashflow.id],
      );
    } catch (e) {
      print('Error CashflowLocalDataSource updateKasir: ${e.toString()}');
    }
  }

  Future<void> deleteCashflow(int id) async {
    try {
      await database.delete(
        Cashflow.tableName,
        where: 'id = ?',
        whereArgs: [id],
      );
    } catch (e) {
      print('Error CashflowLocalDataSource deleteKasir: ${e.toString()}');
    }
  }
}
