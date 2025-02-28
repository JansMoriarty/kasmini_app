import 'package:equatable/equatable.dart';

abstract class ListKasirEvent extends Equatable {
  const ListKasirEvent();

  @override
  List<Object?> get props => [];
}

class LoadAllKasir extends ListKasirEvent {
  const LoadAllKasir();

  @override
  List<Object?> get props => [];
}

class AddKasir extends ListKasirEvent {
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

class DeleteKasir extends ListKasirEvent {
  final int id;

  const DeleteKasir({
    required this.id,
  });

  @override
  List<Object?> get props => [id];
}
