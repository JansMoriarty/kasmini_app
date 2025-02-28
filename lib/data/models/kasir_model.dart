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
      nama: map['nama'] as String,
      noHp: map['noHp'] as String?,
      pin: map['pin'] as String,
      role: RoleKasir.values.byName(map['role']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nama': nama,
      'noHp': noHp,
      'pin': pin,
      'role': role.name,
    };
  }

  KasirModel copyWith({
    int? id,
    String? nama,
    String? noHp,
    String? pin,
    RoleKasir? role,
  }) {
    return KasirModel(
      id: id ?? this.id,
      nama: nama ?? this.nama,
      noHp: noHp ?? this.noHp,
      pin: pin ?? this.pin,
      role: role ?? this.role,
    );
  }
}
