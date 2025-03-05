import 'package:equatable/equatable.dart';
import 'package:kasmini_app/domain/entities/produk.dart';

enum StatusProduk {
  initial,
  loading,
  loaded,
  updating,
  updated,
  error,
}

class ProdukState extends Equatable {
  final StatusProduk status;
  final List<Produk> produkData;
  final Produk? produk;
  final String? errorMessage;

  const ProdukState({
    this.status = StatusProduk.initial,
    this.produkData = const [],
    this.produk,
    this.errorMessage,
  });

  ProdukState copyWith({
    StatusProduk? status,
    List<Produk>? produkData,
    Produk? produk,
    String? errorMessage,
  }) {
    return ProdukState(
      status: status ?? this.status,
      produkData: produkData ?? this.produkData,
      produk: produk ?? this.produk,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, produkData, produk, errorMessage];
}