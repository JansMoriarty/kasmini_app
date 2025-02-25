import 'package:kasmini_app/domain/entities/transaksi.dart';

abstract class TransaksiRepo {
  Future<List<Transaksi>?> getAllTransaksi({Map<String, dynamic> filter = const {}});
  Future<Transaksi?> getTransaksi({Map<String, dynamic> filter = const {}});
  Future<void> addTransaksi(Transaksi newTransaksi);
  Future<void> updateTransaksi(Transaksi transaksi);
  Future<void> deleteTransaksi(int id);
}