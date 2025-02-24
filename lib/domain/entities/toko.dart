class Toko {
  static const tableName = 'toko';

  final int? id;
  final int templateStrukId;
  final String? nama;
  final String? alamat;
  final int settingProfit;
  final int ukuranKertas;
  final int cashDrawer;
  final int printerAutoCut;
  final int pembulatanKeuntungan;
  final String? footerMessage;

  Toko({
    this.id,
    required this.templateStrukId,
    this.nama,
    this.alamat,
    required this.settingProfit,
    required this.ukuranKertas,
    required this.cashDrawer,
    required this.printerAutoCut,
    required this.pembulatanKeuntungan,
    required this.footerMessage,
  });
}
