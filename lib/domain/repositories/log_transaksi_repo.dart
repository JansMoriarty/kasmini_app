import 'package:kasmini_app/domain/entities/log_transaksi.dart';

abstract class LogTransaksiRepo {
  Future<List<LogTransaksi>?> getAllLogTransaksi({Map<String, dynamic> filter = const {}});
  Future<LogTransaksi?> getLogTransaksi({Map<String, dynamic> filter = const {}});
  Future<void> addLogTransaksi(LogTransaksi newLogTransaksi);
  Future<void> updateLogTransaksi(LogTransaksi logTransaksi);
  Future<void> deleteLogTransaksi(int id);
}