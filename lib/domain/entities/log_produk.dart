enum TipeProduk {
  pemasukan,
  pengeluaran,
}

class LogProduk {
  static const tableName = 'log_produk';

  final int? id;
  final int kasirId;
  final int produkId;
  final int qty;
  final DateTime tanggal;
  final TipeProduk tipe;

  LogProduk({
    this.id,
    required this.kasirId,
    required this.produkId,
    required this.qty,
    required this.tanggal,
    required this.tipe,
  });
}
