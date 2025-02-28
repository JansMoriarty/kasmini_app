import 'package:kasmini_app/data/datasources/produk_local_data_source.dart';
import 'package:kasmini_app/domain/entities/produk.dart';
import 'package:kasmini_app/domain/repositories/produk_repo.dart';

class ProdukRepoImpl implements ProdukRepo {
  final ProdukLocalDataSource localDataSource;

  ProdukRepoImpl(this.localDataSource);

  @override
  Future<List<Produk>?> getAllProduk({Map<String, dynamic> filter = const {}}) async {
    final result = await localDataSource.getAllProduk(filter: filter);

    return result;
  }

  @override
  Future<Produk?> getProduk({Map<String, dynamic> filter = const {}}) async {
    final result = await localDataSource.getProduk(filter: filter);

    return result;
  }

  @override
  Future<void> addProduk(Produk newProduk) async {
    await localDataSource.addProduk(newProduk);
  }

  @override
  Future<void> updateProduk(Produk produk) async {
    await localDataSource.updateProduk(produk);
  }

  @override
  Future<void> deleteProduk(int id) async {
    await localDataSource.deleteProduk(id);
  }
}
