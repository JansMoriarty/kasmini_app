import 'package:equatable/equatable.dart';

abstract class ProdukEvent extends Equatable {
  const ProdukEvent();

  @override
  List<Object?> get props => [];
}

class LoadAllProduk extends ProdukEvent {}

class LoadProdukById extends ProdukEvent {
  final int id;

  const LoadProdukById(this.id);

  @override
  List<Object?> get props => [id];
}

class AddProduk extends ProdukEvent {
  final String nama;
  final int satuanId;
  final int kategoriId;
  final String qrCode;
  final int hargaModal;
  final String? fotoProduk;

  const AddProduk({
    required this.nama,
    required this.satuanId,
    required this.kategoriId,
    required this.qrCode,
    required this.hargaModal,
    this.fotoProduk,
  });

  @override
  List<Object?> get props => [
        nama,
        satuanId,
        kategoriId,
        qrCode,
        hargaModal,
        fotoProduk,
      ];
}

class UpdateProduk extends ProdukEvent {
  final int id;
  final String nama;
  final int satuanId;
  final int kategoriId;
  final String qrCode;
  final int hargaModal;
  final int keuntungan;
  final String? fotoProduk;
  final bool isFavorite;

  const UpdateProduk({
    required this.id,
    required this.nama,
    required this.satuanId,
    required this.kategoriId,
    required this.qrCode,
    required this.hargaModal,
    required this.keuntungan,
    required this.fotoProduk,
    required this.isFavorite,
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
