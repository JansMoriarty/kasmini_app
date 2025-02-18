import 'package:flutter/material.dart';
import 'package:kasmini_app/presentation/design/card_history.dart';
import 'package:kasmini_app/presentation/views/report/laporan_transaksi.dart';  // Untuk format tanggal

class MainReport extends StatefulWidget {
  const MainReport({super.key});

  @override
  State<MainReport> createState() => _MainReportState();
}

class _MainReportState extends State<MainReport> {
  String selectedReport = 'Pilih Laporan'; // Default teks untuk laporan
  int _selectedIndex = 0; // Indeks untuk menentukan halaman yang sedang aktif

  // Menampilkan bottom sheet dengan daftar laporan
  void _showReportOptions() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.6,
          child: Column(
            children: [
              // AppBar untuk modal bottom sheet
              Container(
                decoration: BoxDecoration(
                  color: Color(0xff2196f3),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Daftar Laporan',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.close, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                ),
              ),
              // Konten daftar laporan
              Expanded(
                child: Container(
                  color: Color(0xfff5f5f5),
                  child: ListView(
                    padding: EdgeInsets.all(16),
                    children: [
                      _buildListTile('Laporan Transaksi', 0),
                      _buildListTile('Laporan Produk Terjual', 1),
                      _buildListTile('Laporan Stok Produk', 2),
                      _buildListTile('Laporan Kategori', 3),
                      _buildListTile('Laporan Pengeluaran', 4),
                      _buildListTile('Laporan Kasir', 5),
                      _buildListTile('Laporan Metode Pembayaran', 6),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Fungsi untuk membuat ListTile dalam bottom sheet
  Widget _buildListTile(String reportName, int index) {
    return ListTile(
      title: Text(
        reportName,
        style: TextStyle(fontFamily: 'Poppins', fontSize: 14),
      ),
      onTap: () {
        setState(() {
          selectedReport = reportName; // Ganti teks sesuai pilihan
          _selectedIndex = index; // Ubah indeks halaman yang dipilih
        });
        Navigator.pop(context); // Tutup modal setelah memilih
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 38),
        child: Column(
          children: [
            Text(
              'Laporan',
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  color: const Color.fromARGB(185, 0, 0, 0)),
            ),
            SizedBox(height: 28),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  // Pilih Laporan Container
                  Expanded(
                    child: GestureDetector(
                      onTap: _showReportOptions,  // Memanggil fungsi untuk menampilkan daftar laporan
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: const Color(0xffd9d9d9),
                            width: 1,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              selectedReport,
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                color: Color(0xff979797),
                              ),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 12,
                              color: Color(0xff979797),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  // Export Button
                  ElevatedButton(
                    onPressed: () {
                      debugPrint('Export button pressed');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff5755fe),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.description, color: Colors.white),
                        SizedBox(width: 5),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          child: Text(
                            "Export",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Gunakan IndexedStack untuk menampilkan konten berdasarkan laporan yang dipilih
            Expanded(
              child: IndexedStack(
                index: _selectedIndex,
                children: [
                 LaporanTransaksi()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
