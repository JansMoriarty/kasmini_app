import 'package:kasmini_app/domain/entities/toko.dart';

abstract class TokoRepo {
  Future<List<Toko>?> getAllToko({Map<String, dynamic> filter = const {}});
  Future<Toko?> getToko({Map<String, dynamic> filter = const {}});
  Future<void> addToko(Toko newToko);
  Future<void> updateToko(Toko toko);
  Future<void> deleteToko(int id);
}