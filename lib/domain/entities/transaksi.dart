enum StatusTransaksi {
  pemasukan,
  pengeluaran,
}

class Transaksi {
  static const tableName = 'transaksi';

  final int? id;
  final int kasirId;
  final int noAntrian;
  final DateTime tanggal;
  final String namaPelanggan;
  final StatusTransaksi statusTransaksi;

  Transaksi({
    this.id,
    required this.kasirId,
    required this.noAntrian,
    required this.tanggal,
    required this.namaPelanggan,
    required this.statusTransaksi,
  });
}
