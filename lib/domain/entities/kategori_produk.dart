class KategoriProduk {
  static const tableName = 'kategori_produk';

  final int? id;
  final String kategori;

  KategoriProduk({
    this.id,
    required this.kategori,
  });
}
