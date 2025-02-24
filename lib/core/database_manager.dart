import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseManager {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'app.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('PRAGMA foreign_keys = ON');

        await db.execute('''
            CREATE TABLE template_struk (
              id INTEGER PRIMARY KEY,
              nama TEXT NOT NULL,
              logo INTEGER NOT NULL DEFAULT 0,
              namaToko INTEGER NOT NULL DEFAULT 0,
              idTransaksi INTEGER NOT NULL DEFAULT 0,
              antrian INTEGER NOT NULL DEFAULT 0,
              tanggal INTEGER NOT NULL DEFAULT 0,
              namaKasir INTEGER NOT NULL DEFAULT 0,
              namaPelanggan INTEGER NOT NULL DEFAULT 0,
              metodePembayaran INTEGER NOT NULL DEFAULT 0,
              biayaTambahan INTEGER NOT NULL DEFAULT 0,
              ppn INTEGER NOT NULL DEFAULT 0,
              statusTransaksi INTEGER NOT NULL DEFAULT 0,
              hideDiscount INTEGER NOT NULL DEFAULT 0,
              hideChange INTEGER NOT NULL DEFAULT 0,
              footerMessage INTEGER NOT NULL DEFAULT 0
            )
          ''');

        await db.execute('''
            CREATE TABLE toko (
              id INTEGER PRIMARY KEY,
              templateStrukId INTEGER NOT NULL DEFAULT 0,
              nama TEXT,
              alamat TEXT,
              settingProfit INTEGER NOT NULL DEFAULT 0,
              ukuranKertas INTEGER NOT NULL DEFAULT 0,
              cashDrawer INTEGER NOT NULL DEFAULT 0,
              printerAutoCut INTEGER NOT NULL DEFAULT 0,
              pembulatanKeuntungan INTEGER NOT NULL DEFAULT 0,
              footerMessage TEXT,
              FOREIGN KEY (templateStrukId) REFERENCES template_struk(id) ON DELETE NO ACTION
            )
          ''');

        await db.execute('''
            CREATE TABLE kasir (
              id INTEGER PRIMARY KEY,
              nama TEXT NOT NULL,
              noHp TEXT,
              pin TEXT NOT NULL,
              role TEXT NOT NULL,
              foto TEXT
            )
          ''');

        await db.execute('''
            CREATE TABLE cashflow (
              id INTEGER PRIMARY KEY,
              kasirId INTEGER NOT NULL,
              judul TEXT NOT NULL,
              catatan TEXT,
              nominal INT NOT NULL,
              tanggal TEXT NOT NULL,
              tipe TEXT NOT NULL,
              FOREIGN KEY (kasirId) REFERENCES kasir(id) ON DELETE NO ACTION
            )
          ''');

        await db.execute('''
            CREATE TABLE satuan_produk (
              id INTEGER PRIMARY KEY,
              satuan TEXT NOT NULL
            )
          ''');

        await db.execute('''
            CREATE TABLE kategori_produk (
              id INTEGER PRIMARY KEY,
              kategori TEXT NOT NULL
            )
          ''');

        await db.execute('''
            CREATE TABLE produk (
              id INTEGER PRIMARY KEY,
              nama TEXT NOT NULL,
              satuanId INTEGER NOT NULL,
              kategoriId INTEGER NOT NULL,
              qrCode TEXT NOT NULL,
              qty INTEGER NOT NULL,
              hargaModal INTEGER NOT NULL,
              keuntungan INTEGER NOT NULL,
              fotoProduk TEXT,
              isFavorite INTEGER NOT NULL DEFAULT 0,
              FOREIGN KEY (satuanId) REFERENCES satuan_produk(id) ON DELETE NO ACTION,
              FOREIGN KEY (kategoriId) REFERENCES kategori_produk(id) ON DELETE NO ACTION 
            )
          ''');

        await db.execute('''
            CREATE TABLE log_produk (
              id INTEGER PRIMARY KEY,
              kasirId INTEGER NOT NULL,
              produkId INTEGER NOT NULL,
              qty INTEGER NOT NULL,
              tanggal TEXT NOT NULL,
              tipe TEXT NOT NULL,
              FOREIGN KEY (kasirId) REFERENCES kasir(id) ON DELETE NO ACTION,
              FOREIGN KEY (produkId) REFERENCES produk(id) ON DELETE NO ACTION
            )
          ''');

        await db.execute('''
            CREATE TABLE transaksi (
              id INTEGER PRIMARY KEY,
              kasirId INTEGER NOT NULL,
              noAntrian INTEGER NOT NULL,
              tanggal TEXT NOT NULL,
              namaPelanggan TEXT NOT NULL,
              statusTransaksi TEXT NOT NULL,
              FOREIGN KEY (kasirId) REFERENCES kasir(id) ON DELETE NO ACTION
            )
          ''');

        await db.execute('''
            CREATE TABLE detail_transaksi (
              id INTEGER PRIMARY KEY,
              transaksiId INTEGER NOT NULL,
              produkId INTEGER NOT NULL,
              hargaModal INTEGER NOT NULL,
              keuntungan INTEGER NOT NULL,
              qty INTEGER NOT NULL,
              FOREIGN KEY (transaksiId) REFERENCES transaksi(id) ON DELETE NO ACTION,
              FOREIGN KEY (produkId) REFERENCES produk(id) ON DELETE NO ACTION
            )
          ''');

        await db.execute('''
            CREATE TABLE metode_pembayaran (
              id INTEGER PRIMARY KEY,
              metodePembayaran TEXT NOT NULL
            )
          ''');

        await db.execute('''
            CREATE TABLE log_transaksi (
              id INTEGER PRIMARY KEY,
              transaksiId INTEGER NOT NULL,
              metodePembayaranId INTEGER NOT NULL,
              kasirId INTEGER NOT NULL,
              nominal INTEGER NOT NULL,
              tanggal TEXT NOT NULL,
              FOREIGN KEY (transaksiId) REFERENCES transaksi(id) ON DELETE NO ACTION,
              FOREIGN KEY (metodePembayaranId) REFERENCES metodePembayaran(id) ON DELETE NO ACTION
            )
          ''');

        await db.insert('kasir', {
          'nama': 'Owner',
          'pin': '123456',
          'role': 'owner',
        });
      },
    );
  }

  Future<void> closeDatabase() async {
    if (_database != null) {
      await _database!.close();
      _database = null;
    }
  }
}
