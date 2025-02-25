import 'package:kasmini_app/domain/entities/metode_pembayaran.dart';

abstract class MetodePembayaranRepo {
  Future<List<MetodePembayaran>?> getAllMetodePembayaran({Map<String, dynamic> filter = const {}});
  Future<MetodePembayaran?> getMetodePembayaran({Map<String, dynamic> filter = const {}});
  Future<void> addMetodePembayaran(MetodePembayaran newMetodePembayaran);
  Future<void> updateMetodePembayaran(MetodePembayaran metodePembayaran);
  Future<void> deleteMetodePembayaran(int id);
}