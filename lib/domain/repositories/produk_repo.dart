import 'package:kasmini_app/domain/entities/produk.dart';

abstract class ProdukRepo {
  Future<List<Produk>?> getAllProduk({Map<String, dynamic> filter = const {}});
  Future<Produk?> getProduk({Map<String, dynamic> filter = const {}});
  Future<void> addProduk(Produk newProduk);
  Future<void> updateProduk(Produk produk);
  Future<void> deleteProduk(int id);
}