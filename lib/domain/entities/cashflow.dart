enum CashflowType {
  pemasukan,
  pengeluaran,
}

class Cashflow {
  static const tableName =  'cashflow';

  final int? id;
  final int kasirId;
  final String judul;
  final String catatan;
  final int nominal;
  final DateTime tanggal;
  final CashflowType tipe;

  Cashflow({
    this.id,
    required this.kasirId,
    required this.judul,
    required this.catatan,
    required this.nominal,
    required this.tanggal,
    required this.tipe,
  });
}
