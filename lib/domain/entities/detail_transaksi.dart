class DetailTransaksi {
  static const tableName = 'detail_transaksi';

  final int? id;
  final int transaksiId;
  final int produkId;
  final int hargaModal;
  final int keuntungan;
  final int qty;

  DetailTransaksi({
    this.id,
    required this.transaksiId,
    required this.produkId,
    required this.hargaModal,
    required this.keuntungan,
    required this.qty,
  });
}
