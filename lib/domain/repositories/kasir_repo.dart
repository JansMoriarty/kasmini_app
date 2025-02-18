import 'package:kasmini_app/domain/entities/kasir.dart';

abstract class KasirRepo {
  Future<List<Kasir>?> getAllKasir();
  Future<Kasir?> getKasir(Map<String, dynamic> filter);
  Future<void> addKasir(Kasir newKasir);
  Future<void> updateKasir(Kasir kasir);
  Future<void> deleteKasir(int id);
}