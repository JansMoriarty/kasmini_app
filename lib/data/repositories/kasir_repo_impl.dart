import 'package:kasmini_app/data/datasources/kasir_local_data_source.dart';
import 'package:kasmini_app/domain/entities/kasir.dart';
import 'package:kasmini_app/domain/repositories/kasir_repo.dart';

class KasirRepoImpl implements KasirRepo {
  final KasirLocalDataSource localDataSource;

  KasirRepoImpl(this.localDataSource);

  @override
  Future<List<Kasir>?> getAllKasir({Map<String, dynamic> filter = const {}}) async {
    final result = await localDataSource.getAllKasir(filter: filter);

    return result;
  }

  @override
  Future<Kasir?> getKasir({Map<String, dynamic> filter = const {}}) async {
    final result = await localDataSource.getKasir(filter: filter);

    return result;
  }

  @override
  Future<void> addKasir(Kasir newKasir) async {
    await localDataSource.addKasir(newKasir);
  }

  @override
  Future<void> updateKasir(Kasir kasir) async {
    await localDataSource.updateKasir(kasir);
  }

  @override
  Future<void> deleteKasir(int id) async {
    await localDataSource.deleteKasir(id);
  }
}
