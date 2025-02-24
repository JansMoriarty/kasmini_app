class TemplateStruk {
  static const tableName = 'template_struk';

  final int? id;
  final String nama;
  final int logo;
  final int namaToko;
  final int idTransaksi;
  final int antrian;
  final int tanggal;
  final int namaKasir;
  final int namaPelanggan;
  final int metodePembayaran;
  final int biayaTambahan;
  final int ppn;
  final int statusTransaksi;
  final int hideDiscount;
  final int hideChange;
  final int footerMessage;

  TemplateStruk({
    this.id,
    required this.nama,
    required this.logo,
    required this.namaToko,
    required this.idTransaksi,
    required this.antrian,
    required this.tanggal,
    required this.namaKasir,
    required this.namaPelanggan,
    required this.metodePembayaran,
    required this.biayaTambahan,
    required this.ppn,
    required this.statusTransaksi,
    required this.hideDiscount,
    required this.hideChange,
    required this.footerMessage,
  });
}
