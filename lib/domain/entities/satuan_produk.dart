class SatuanProduk {
  static const tableName = 'satuan_produk';

  final int? id;
  final String satuan;

  SatuanProduk({
    this.id,
    required this.satuan,
  });
}
