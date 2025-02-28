import 'package:kasmini_app/domain/entities/produk.dart';

class ProdukModel extends Produk {
  ProdukModel({
    super.id,
    required super.nama,
    required super.satuanId,
    required super.kategoriId,
    required super.qrCode,
    required super.hargaModal,
    required super.keuntungan,
    super.fotoProduk,
    required super.isFavorite,
  });

  factory ProdukModel.fromMap(Map<String, dynamic> map) {
    return ProdukModel(
      id: map['id'] as int,
      nama: map['nama'] as String,
      satuanId: map['satuanId'] as int,
      kategoriId: map['kategoriId'] as int,
      qrCode: map['qrCode'] as String,
      hargaModal: map['hargaModal'] as int,
      keuntungan: map['keuntungan'] as int,
      fotoProduk: map['fotoProduk'] as String,
      isFavorite: map['isFavorite'] as bool,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nama': nama,
      'satuanId': satuanId,
      'kategoriId': kategoriId,
      'qrCode': qrCode,
      'hargaModal': hargaModal,
      'keuntungan': keuntungan,
      'fotoProduk': fotoProduk,
      'isFavorite': isFavorite,
    };
  }
}
