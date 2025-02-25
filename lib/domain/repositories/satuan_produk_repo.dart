import 'package:kasmini_app/domain/entities/satuan_produk.dart';

abstract class SatuanProdukRepo {
  Future<List<SatuanProduk>?> getAllSatuanProduk({Map<String, dynamic> filter = const {}});
  Future<SatuanProduk?> getSatuanProduk({Map<String, dynamic> filter = const {}});
  Future<void> addSatuanProduk(SatuanProduk newSatuanProduk);
  Future<void> updateSatuanProduk(SatuanProduk satuanProduk);
  Future<void> deleteSatuanProduk(int id);
}