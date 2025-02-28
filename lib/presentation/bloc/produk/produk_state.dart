import 'package:equatable/equatable.dart';
import 'package:kasmini_app/domain/entities/produk.dart';

enum StatusProduk {
  initial,
  loading,
  loaded,
  error,
  updating,
  updated,
}

class ProdukState extends Equatable {
  final StatusProduk status;
  final List<Produk> produkData;
  final String? errorMessage;

  const ProdukState({
    this.status = StatusProduk.initial,
    this.produkData = const [],
    this.errorMessage,
  });

  ProdukState copyWith({
    StatusProduk? status,
    List<Produk>? produkData,
    String? errorMessage,
  }) {
    return ProdukState(
      status: status ?? this.status,
      produkData: produkData ?? this.produkData,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, produkData, errorMessage];
}