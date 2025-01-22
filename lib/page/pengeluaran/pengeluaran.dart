import 'package:flutter/material.dart';
import 'package:kasmini_app/design/card_history.dart';
import 'package:kasmini_app/design/ex_prodwidget.dart';
import 'package:kasmini_app/page/add_prod.dart';
import 'package:kasmini_app/page/history/belum_bayar.dart';
import 'package:kasmini_app/page/history/belum_lunas.dart';
import 'package:kasmini_app/page/history/detail_history.dart';
import 'package:kasmini_app/page/history/dibatalkan.dart';
import 'package:kasmini_app/page/home.dart';
import 'package:kasmini_app/page/kategori.dart';
import 'package:kasmini_app/main_page.dart';
import 'package:kasmini_app/page/pengeluaran/data_pengeluaran.dart';
import 'package:kasmini_app/page/pilih_prod.dart';
import 'package:kasmini_app/page/success.dart';
import 'package:lottie/lottie.dart';

class Pengeluaran extends StatelessWidget {
  const Pengeluaran({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 255, 255, 255),
        width: double.infinity, // Mengisi seluruh lebar layar
        height: double.infinity, // Mengisi seluruh tinggi layar
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Pengeluaran',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Poppins',
                            color: const Color.fromARGB(185, 0, 0, 0),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MainPage()));
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 28),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 22, vertical: 8),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: const BorderSide(
                                    color: Color(0xffd9d9d9),
                                    width: 1,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: const BorderSide(
                                    color: Color(0xffd9d9d9),
                                    width: 1,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: const BorderSide(
                                    color: Color(0xffd9d9d9),
                                    width: 2,
                                  ),
                                ),
                                hintText: 'Search',
                                hintStyle: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 13,
                                  color: Color(0xff979797),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          PopupMenuButton<String>(
                            onSelected: (value) {
                              debugPrint("Selected: $value");
                            },
                            color: Color(0xff5755fe),
                            itemBuilder: (context) => [
                              PopupMenuItem(
                                value: "A-Z",
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Container(
                                        color: Colors.white,
                                        child: Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: Icon(
                                            Icons.arrow_upward_rounded,
                                            color: Color(0xff5755fe),
                                            size: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "A - Z",
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Color.fromARGB(
                                              255, 255, 255, 255)),
                                    ),
                                  ],
                                ),
                              ),
                              PopupMenuItem(
                                value: "Z-A",
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Container(
                                        color: Colors.white,
                                        child: Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: Icon(
                                            Icons.arrow_downward_rounded,
                                            color: Color(0xff5755fe),
                                            size: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      "Z - A",
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              PopupMenuItem(
                                value: "Stok1",
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Container(
                                        color: Colors.white,
                                        child: Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: Icon(
                                            Icons.trending_up_rounded,
                                            color: Color(0xff5755fe),
                                            size: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      "Stok",
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              PopupMenuItem(
                                value: "Stok2",
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Container(
                                        color: Colors.white,
                                        child: Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: Icon(
                                            Icons.trending_down_rounded,
                                            color: Color(0xff5755fe),
                                            size: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      "Stok",
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                            icon: const Icon(Icons.sort),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 28,
                      ),
                      Container(
                        width: double.infinity,
                        height: 120,
                        margin: const EdgeInsets.all(0), // Margin luar kartu
                        padding:
                            const EdgeInsets.all(18), // Padding dalam kartu
                        decoration: BoxDecoration(
                          color: Colors.white, // Warna background kartu
                          borderRadius:
                              BorderRadius.circular(16), // Sudut membulat
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(56, 0, 0, 0),
                              blurRadius: 6,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Gaji Karyawan',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromARGB(255, 134, 134, 134),
                                    ),
                                  ),
                                  const SizedBox(height: 1),
                                  const Divider(
                                    color: Color.fromARGB(255, 200, 200, 200),
                                    thickness: 0.7,
                                  ),
                                  const Text(
                                    'Selasa, 14 Jan 2025',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Color.fromARGB(255, 163, 163, 163),
                                      fontSize: 10,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Biaya   :',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Color.fromARGB(
                                              255, 163, 163, 163),
                                          fontSize: 12,
                                        ),
                                      ),
                                      const Text(
                                        'Rp. 1.900.000,00',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Poppins',
                                          color: Color.fromARGB(
                                              255, 163, 163, 163),
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius
                                            .zero, // Tidak ada radius di peringatan
                                      ),
                                      backgroundColor: Colors
                                          .transparent, // Menggunakan background transparan
                                      contentPadding: EdgeInsets
                                          .zero, // Menghilangkan padding default
                                      content: Container(
                                        constraints: BoxConstraints(
                                          maxWidth:
                                              300, // Batasi lebar maksimum dialog
                                          maxHeight:
                                              300, // Batasi tinggi maksimum dialog
                                        ),
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              const Color.fromARGB(
                                                  255, 255, 255, 255),
                                              Colors.white
                                            ], // Gradien biru ke putih
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                          ),
                                          borderRadius: BorderRadius
                                              .zero, // Tidak ada radius
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize
                                              .min, // Agar kolom tidak memenuhi seluruh ruang
                                          children: [
                                            Container(
                                              width: double.infinity,
                                              height: 180,
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  colors: [
                                                    Color(0xff5755fe),
                                                    Color(0xff5755fe)
                                                  ], // Warna biru di atas
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                ),
                                              ),
                                              child:  Padding(
                                                padding: const EdgeInsets.symmetric(vertical: 12),
                                                child: Center(
                                                  child: LottieBuilder.asset('../assets/lottie/alert.json'),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(16.0),
                                              child: const Text(
                                                'Apakah kamu benar-benar ingin menghapus ini?',
                                                style: TextStyle(
                                                    fontFamily: 'Poppins'),
                                                textAlign: TextAlign
                                                    .center, // Menyelaraskan teks di tengah
                                              ),
                                            ),
                                            ButtonBar(
                                              alignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context)
                                                        .pop(); // Tutup dialog
                                                  },
                                                  child: const Text(
                                                    'Batal',
                                                    style: TextStyle(
                                                        fontFamily: 'Poppins'),
                                                  ),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    // Tambahkan logika hapus di sini
                                                    Navigator.of(context)
                                                        .pop(); // Tutup dialog
                                                  },
                                                  child: const Text(
                                                    'Hapus',
                                                    style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.red),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 90,
        child: Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 13,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6)),
                          fixedSize: Size(double.maxFinite, 50),
                          elevation: 0,
                          backgroundColor: const Color(0xff5755fe),
                          shadowColor: Colors.transparent,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DataPengeluaran()),
                          );
                        },
                        child: Text(
                          'Tambah Pengeluaran',
                          style: TextStyle(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              fontFamily: 'Poppins'),
                        ),
                      ),
                    ),
                    SizedBox(width: 8), // Jarak antar tombol
                    Expanded(
                      flex: 7,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6)),
                          fixedSize: Size(double.maxFinite, 50),
                          elevation: 0,
                          side: BorderSide(color: Color(0xff5755fe), width: 2),
                          backgroundColor:
                              const Color.fromARGB(255, 255, 255, 255),
                          shadowColor: Colors.transparent,
                        ),
                        onPressed: () {
                          // Logika untuk tombol Tambah Barang
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PilihProd()));
                        },
                        child: Text(
                          'Jumlah',
                          style: TextStyle(
                              color: const Color(0xff5755fe),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
