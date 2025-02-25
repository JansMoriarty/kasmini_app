class MetodePembayaran {
  static const tableName = 'metode_pembayaran';

  final int? id;
  final String metodePembayaran;

  MetodePembayaran({
    this.id,
    required this.metodePembayaran,
  });
}
