import 'package:equatable/equatable.dart';

abstract class DetailKasirEvent extends Equatable {
  const DetailKasirEvent();

  @override
  List<Object?> get props => [];
}

class LoadKasirById extends DetailKasirEvent {
  final int id;

  const LoadKasirById(this.id);

  @override
  List<Object?> get props => [id];
}

class UpdateKasir extends DetailKasirEvent {
  final int id;
  final String? nama;
  final String? noHp;
  final String? pin;

  const UpdateKasir({
    required this.id,
    this.nama,
    this.noHp,
    this.pin
  });

  @override
  List<Object?> get props => [id, nama, noHp, pin];
}