import 'package:kasmini_app/domain/entities/detail_transaksi.dart';

abstract class DetailTransaksiRepo {
  Future<List<DetailTransaksi>?> getAllDetailTransaksi({Map<String, dynamic> filter = const {}});
  Future<DetailTransaksi?> getDetailTransaksi({Map<String, dynamic> filter = const {}});
  Future<void> addDetailTransaksi(DetailTransaksi newDetailTransaksi);
  Future<void> updateDetailTransaksi(DetailTransaksi detailTransaksi);
  Future<void> deleteDetailTransaksi(int id);
}