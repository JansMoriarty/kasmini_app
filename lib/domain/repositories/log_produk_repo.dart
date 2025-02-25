import 'package:kasmini_app/domain/entities/log_produk.dart';

abstract class LogProdukRepo {
  Future<List<LogProduk>?> getAllLogProduk({Map<String, dynamic> filter = const {}});
  Future<LogProduk?> getLogProduk({Map<String, dynamic> filter = const {}});
  Future<void> addLogProduk(LogProduk newLogProduk);
  Future<void> updateLogProduk(LogProduk logProduk);
  Future<void> deleteLogProduk(int id);
}