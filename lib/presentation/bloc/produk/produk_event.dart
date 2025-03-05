import 'package:equatable/equatable.dart';

abstract class ProdukEvent extends Equatable {
  const ProdukEvent();

  @override
  List<Object?> get props => [];
}

class LoadProdukById extends ProdukEvent {
  final int id;

  const LoadProdukById(this.id);

  @override
  List<Object?> get props => [id];
}

class LoadAllProduk extends ProdukEvent {
  const LoadAllProduk();

  @override
  List<Object?> get props => [];
}

class AddProduk extends ProdukEvent {
  final String nama;
  final String? noHp;
  final String pin;
  final String role;

  const AddProduk({
    required this.nama,
    this.noHp,
    required this.pin,
    required this.role,
  });

  @override
  List<Object?> get props => [nama, noHp, pin, role];
}

class UpdateProduk extends ProdukEvent {
  final int id;
  final String? nama;
  final int? satuanId;
  final int? kategoriId;
  final String? qrCode;
  final int? hargaModal;
  final int? keuntungan;
  final String? fotoProduk;
  final bool? isFavorite;

  const UpdateProduk({
    required this.id,
    this.nama,
    this.satuanId,
    this.kategoriId,
    this.qrCode,
    this.hargaModal,
    this.keuntungan,
    this.fotoProduk,
    this.isFavorite,
  });

  @override
  List<Object?> get props => [
        id,
        nama,
        satuanId,
        kategoriId,
        qrCode,
        hargaModal,
        keuntungan,
        fotoProduk,
        isFavorite,
      ];
}

class DeleteProduk extends ProdukEvent {
  final int id;

  const DeleteProduk({
    required this.id,
  });

  @override
  List<Object?> get props => [id];
}
