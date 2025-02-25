class LogTransaksi {
  static const tableName = 'log_transaksi';

  final int? id;
  final int transaksiId;
  final int metodePembayaranId;
  final int kasirId;
  final int nominal;
  final DateTime tanggal;

  LogTransaksi({
    this.id,
    required this.transaksiId,
    required this.metodePembayaranId,
    required this.kasirId,
    required this.nominal,
    required this.tanggal,
  });
}
