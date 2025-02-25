enum RoleKasir {
  owner,
  kasir,
}

class Kasir {
  static const tableName = 'kasir';

  final int? id;
  final String nama;
  final String? noHp;
  final String pin;
  final RoleKasir role;

  Kasir({
    this.id,
    required this.nama,
    this.noHp,
    required this.pin,
    required this.role,
  });
}
