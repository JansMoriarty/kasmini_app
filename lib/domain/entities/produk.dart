class Produk {
  static const tableName = 'produk';

  final int? id;
  final String nama;
  final int satuanId;
  final int kategoriId;
  final String qrCode;
  final int hargaModal;
  final int keuntungan;
  final String? fotoProduk;
  final bool isFavorite;


  Produk({
    this.id,
    required this.nama,
    required this.satuanId,
    required this.kategoriId,
    required this.qrCode,
    required this.hargaModal,
    required this.keuntungan,
    this.fotoProduk,
    required this.isFavorite,
  });
}
