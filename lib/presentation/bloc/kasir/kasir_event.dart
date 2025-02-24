import 'package:equatable/equatable.dart';

abstract class KasirEvent extends Equatable {
  const KasirEvent();

  @override
  List<Object?> get props => [];
}

class LoadAllKasir extends KasirEvent {}

class LoadKasirById extends KasirEvent {
  final int id;

  const LoadKasirById(this.id);

  @override
  List<Object?> get props => [id];
}

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

  @override
  List<Object?> get props => [nama, noHp, pin, role];
}

class UpdateKasir extends KasirEvent {
  final int id;
  final String nama;
  final String? noHp;
  final String pin;

  const UpdateKasir({
    required this.id,
    required this.nama,
    this.noHp,
    required this.pin,
  });

  @override
  List<Object?> get props => [id, nama, noHp, pin];
}

class DeleteKasir extends KasirEvent {
  final int id;

  const DeleteKasir({
    required this.id,
  });

  @override
  List<Object?> get props => [id];
}
