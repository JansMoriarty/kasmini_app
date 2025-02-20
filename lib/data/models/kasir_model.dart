import 'package:kasmini_app/domain/entities/kasir.dart';

class KasirModel extends Kasir {
  KasirModel({
    required super.id,
    required super.nama,
    required super.noHp,
    required super.pin,
    required super.role,
  });

  factory KasirModel.fromMap(Map<String, dynamic> map) {
    return KasirModel(
      id: map['id'] as int,
      nama: map['nama'] ?? '',
      noHp: map['noHp'] as String?,
      pin: map['pin'] ?? '',
      role: map['role'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nama': nama,
      'noHp': noHp,
      'pin': pin,
      'role': role,
    };
  }
}
