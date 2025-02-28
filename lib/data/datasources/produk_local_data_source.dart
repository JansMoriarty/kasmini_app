import 'package:kasmini_app/data/models/produk_model.dart';
import 'package:kasmini_app/domain/entities/kasir.dart';
import 'package:kasmini_app/domain/entities/produk.dart';
import 'package:sqflite/sqflite.dart';

class ProdukLocalDataSource {
  final Database database;

  ProdukLocalDataSource(this.database);

  Future<List<Produk>?> getAllProduk(
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
        Produk.tableName,
        where: whereClause,
        whereArgs: whereArgs,
      );

      if (query.isEmpty) {
        return null;
      }

      return query.map((produk) => ProdukModel.fromMap(produk)).toList();
    } catch (e) {
      print('Error ProdukLocalDataSource getAllProduk: ${e.toString()}');
      return null;
    }
  }

  Future<Produk?> getProduk({Map<String, dynamic> filter = const {}}) async {
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
        Produk.tableName,
        where: whereClause,
        whereArgs: whereArgs,
        limit: 1,
      );

      if (query.isEmpty) {
        return null;
      }

      return ProdukModel.fromMap(query.first);
    } catch (e) {
      print('Error ProdukLocalDataSource getAllProduk: ${e.toString()}');
      return null;
    }
  }

  Future<void> addProduk(Produk newProduk) async {
    try {
      final ProdukModel produkModel = ProdukModel(
        id: newProduk.id,
        nama: newProduk.nama,
        satuanId: newProduk.satuanId,
        kategoriId: newProduk.kategoriId,
        qrCode: newProduk.qrCode,
        hargaModal: newProduk.hargaModal,
        keuntungan: newProduk.keuntungan,
        fotoProduk: newProduk.fotoProduk,
        isFavorite: newProduk.isFavorite,
      );

      await database.insert(
        Kasir.tableName,
        produkModel.toMap(),
      );
    } catch (e) {
      print('Error ProdukLocalDataSource addProduk: ${e.toString()}');
    }
  }

  Future<void> updateProduk(Produk produk) async {
    try {
      final produkModel = ProdukModel(
        id: produk.id,
        nama: produk.nama,
        satuanId: produk.satuanId,
        kategoriId: produk.kategoriId,
        qrCode: produk.qrCode,
        hargaModal: produk.hargaModal,
        keuntungan: produk.keuntungan,
        fotoProduk: produk.fotoProduk,
        isFavorite: produk.isFavorite
      );

      await database.update(
        Produk.tableName,
        produkModel.toMap(),
        where: 'id = ?',
        whereArgs: [produk.id],
      );
    } catch (e) {
      print('Error ProdukLocalDataSource updateProduk: ${e.toString()}');
    }
  }

  Future<void> deleteProduk(int id) async {
    try {
      await database.delete(
        Produk.tableName,
        where: 'id = ?',
        whereArgs: [id],
      );
    } catch (e) {
      print('Error ProdukLocalDataSource deleteProduk: ${e.toString()}');
    }
  }
}
