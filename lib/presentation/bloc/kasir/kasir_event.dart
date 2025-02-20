abstract class KasirEvent {
  const KasirEvent();
}

class LoadKasir extends KasirEvent {}

class AddKasir extends KasirEvent {
  final String nama;
  final String? noHp;
  final String pin;
  final String role;

  const AddKasir({
    required this.nama,
    this.noHp,
    required this.pin,
    required this.role,
  });
}

class UpdateKasir extends KasirEvent {
  final int id;
  final String nama;
  final String? noHp;
  final String pin;
  final String role;

  const UpdateKasir({
    required this.id,
    required this.nama,
    this.noHp,
    required this.pin,
    required this.role,
  });
}

class DeleteKasir extends KasirEvent {
  final int id;

  const DeleteKasir({
    required this.id,
  });
}
