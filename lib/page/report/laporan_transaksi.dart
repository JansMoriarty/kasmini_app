import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kasmini_app/design/card_laporan_transaksi.dart';

class LaporanTransaksi extends StatefulWidget {
  const LaporanTransaksi({super.key});

  @override
  State<LaporanTransaksi> createState() => _LaporanTransaksiState();
}

class _LaporanTransaksiState extends State<LaporanTransaksi> {
  DateTime? fromDate; // Menyimpan tanggal 'From'
  DateTime? toDate; // Menyimpan tanggal 'To'

  // Fungsi untuk memilih tanggal
  Future<void> _selectDate(BuildContext context, bool isFromDate) async {
    final DateTime initialDate = DateTime.now();
    final DateTime firstDate = DateTime(2020);
    final DateTime lastDate = DateTime(2101);

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (picked != null) {
      setState(() {
        if (isFromDate) {
          fromDate = picked;
        } else {
          toDate = picked;
        }
      });
    }
  }

  // Fungsi untuk format tanggal menjadi "21 Jan, 2025"
  String _formatDate(DateTime? date) {
    if (date == null) {
      return 'Tanggal Awal'; // Default text
    }
    return DateFormat('d MMM, yyyy').format(date); // Format tanggal
  }

  @override
  Widget build(BuildContext context) {
    // Mendapatkan lebar layar perangkat
    final double screenWidth = MediaQuery.of(context).size.width;

    // Ukuran elemen responsif
    final double containerWidth = screenWidth * 0.315; // 30% dari lebar layar
    final double fontSize = screenWidth * 0.027; // 3% dari lebar layar

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 36),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'From',
                  style: TextStyle(fontFamily: 'Poppins', fontSize: fontSize),
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () => _selectDate(context,
                      true), // Memanggil fungsi untuk memilih tanggal "From"
                  child: Container(
                    height: 40,
                    width: containerWidth, // Responsif
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromARGB(255, 234, 234, 234),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _formatDate(fromDate),
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: fontSize,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromARGB(255, 108, 108, 108),
                            ),
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            color: const Color.fromARGB(255, 98, 98, 98),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  'To',
                  style: TextStyle(fontFamily: 'Poppins', fontSize: fontSize),
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () => _selectDate(context,
                      false), // Memanggil fungsi untuk memilih tanggal "To"
                  child: Container(
                    height: 40,
                    width: containerWidth, // Responsif
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromARGB(255, 236, 236, 236),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _formatDate(toDate),
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: fontSize,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromARGB(255, 108, 108, 108),
                            ),
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            color: const Color.fromARGB(255, 98, 98, 98),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Transaksi()
            // Tambahkan elemen lain di sini
          ],
        ),
      ),
    );
  }
}
