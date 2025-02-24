import 'package:kasmini_app/domain/entities/kasir.dart';

abstract class KasirRepo {
  Future<List<Kasir>?> getAllKasir({Map<String, dynamic> filter = const {}});
  Future<Kasir?> getKasir({Map<String, dynamic> filter = const {}});
  Future<void> addKasir(Kasir newKasir);
  Future<void> updateKasir(Kasir kasir);
  Future<void> deleteKasir(int id);
}