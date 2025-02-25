import 'package:kasmini_app/domain/entities/kategori_produk.dart';

abstract class KategoriProdukRepo {
  Future<List<KategoriProduk>?> getAllKategoriProduk({Map<String, dynamic> filter = const {}});
  Future<KategoriProduk?> getKategoriProduk({Map<String, dynamic> filter = const {}});
  Future<void> addKategoriProduk(KategoriProduk newKategoriProduk);
  Future<void> updateKategoriProduk(KategoriProduk kategoriProduk);
  Future<void> deleteKategoriProduk(int id);
}