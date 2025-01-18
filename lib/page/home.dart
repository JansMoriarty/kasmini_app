import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:kasmini_app/design/nav.dart';
import 'package:kasmini_app/page/account/akun_kasir.dart';
import 'package:kasmini_app/page/edit_toko.dart';
import 'package:kasmini_app/page/example_prod.dart';
import 'package:kasmini_app/page/history/history.dart';
import 'package:kasmini_app/page/manage_stok.dart';
import 'package:kasmini_app/page/pengeluaran/pengeluaran.dart';
import 'package:kasmini_app/page/print_resi.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  int _selectedIndex = 0; // Default tab adalah Home

  // Fungsi untuk menangani perubahan tab
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigasi berdasarkan tab yang dipilih
    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const History()),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const History()),
        );
        break;
      case 3:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const History()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 28,
              vertical: 40), // Mengurangi padding agar lebih responsif
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          "Selamat Datang!",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Pauzan Rizky Alamsyah",
                          style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFF5755FE),
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins'),
                        ),
                      ],
                    ),
                    const CircleAvatar(
                      radius: 25,
                      backgroundImage:
                          AssetImage('../assets/images/avatar.jpg'),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                // Info Card
                Container(
                  height: 210,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Color(0xFF5755FE),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 6),
                                  child: Text(
                                    "Nama Toko",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Poppins'),
                                  ),
                                ),
                                Text(
                                  "Lokasi Toko",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Poppins'),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 6, right: 4),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              StoreSettingsPage(),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      width: 65,
                                      height: 65,
                                      color: const Color.fromARGB(
                                          255, 255, 255, 255),
                                      child: Icon(
                                        Icons.camera_alt_rounded,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  )),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: SizedBox(
                            width: double.maxFinite,
                            child: Divider(
                              color: const Color.fromARGB(166, 255, 255, 255),
                              thickness: 0.7,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Container(
                                  height: 22,
                                  width: 22,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(100)),
                                  child: Icon(
                                    Icons.shopping_cart_rounded,
                                    color: Color(0xFF5755FE),
                                    size: 16.5,
                                  )),
                            ),
                            Text(
                              "Total Penjualan  : Rp. 0,",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                  fontSize: 15),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Container(
                                  height: 22,
                                  width: 22,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(100)),
                                  child: Icon(
                                    Icons.show_chart_rounded,
                                    color: Color(0xFF5755FE),
                                    size: 16.5,
                                  )),
                            ),
                            Text(
                              "Total Profit           : Rp. 0,",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                  fontSize: 15),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 35),

                const Text(
                  "Menu Layanan",
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 20),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Produk
                      ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Product(),
                              ),
                            );
                          },
                          child: Container(
                            height: 125,
                            width: 160,
                            color: Color.fromARGB(40, 115, 245, 143),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 14),
                                  child: Icon(
                                    Icons.shopping_bag,
                                    color: Color(0xff73F590),
                                    size: 42,
                                  ),
                                ),
                                Text(
                                  'Produk',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff73F590)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      // Kelola Stok
                      ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ManageStok()));
                          },
                          child: Container(
                            height: 125,
                            width: 160,
                            color: const Color.fromARGB(41, 235, 223, 55),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 16),
                                  child: Icon(
                                    Icons.dashboard_customize_rounded,
                                    color: Color.fromARGB(255, 235, 223, 55),
                                    size: 42,
                                  ),
                                ),
                                const Text(
                                  'Kelola Stok',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromARGB(255, 235, 223, 55)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      // Cetak Resi
                      ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PrintResiPage()));
                          },
                          child: Container(
                            height: 125,
                            width: 160,
                            color: const Color.fromARGB(40, 40, 213, 247),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 22),
                                  child: Icon(
                                    Icons.print_rounded,
                                    color: Color.fromARGB(255, 40, 213, 247),
                                    size: 42,
                                  ),
                                ),
                                const Text(
                                  'Cetak Resi',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromARGB(255, 40, 213, 247)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => History()));
                          },
                          child: Container(
                            height: 125,
                            width: 160,
                            color: Color.fromARGB(40, 255, 149, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 22),
                                  child: Icon(
                                    Icons.history_rounded,
                                    color: Color.fromARGB(255, 255, 149, 0),
                                    size: 42,
                                  ),
                                ),
                                const Text(
                                  'Riwayat',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromARGB(255, 255, 149, 0)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 35),
                // Card Pengeluaran
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Pengeluaran()));
                      },
                      child: Container(
                        width: double.infinity,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: const Color.fromARGB(255, 255, 255, 255),
                          boxShadow: [
                            const BoxShadow(
                              color: Color.fromARGB(35, 0, 0, 0),
                              offset: Offset(0, 0),
                              blurRadius: 4,
                              spreadRadius: 0.5,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 16),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      color: Color.fromARGB(59, 255, 125, 120),
                                      child: Icon(
                                        Icons.credit_card_rounded,
                                        color:
                                            Color.fromARGB(255, 255, 125, 120),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, left: 12),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 6),
                                        child: Text(
                                          'Pengeluaran',
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12),
                                        ),
                                      ),
                                      Text(
                                        'Selalu Kelola Pengeluaranmu!',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: const Color.fromARGB(
                                                163, 0, 0, 0),
                                            fontSize: 11),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 18),
                              child: Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: const Color.fromARGB(130, 0, 0, 0),
                                size: 12.5,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AkunKasir()));
                      },
                      child: Container(
                        width: double.infinity,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: const Color.fromARGB(255, 255, 255, 255),
                          boxShadow: [
                            const BoxShadow(
                              color: Color.fromARGB(35, 0, 0, 0),
                              offset: Offset(0, 0),
                              blurRadius: 4,
                              spreadRadius: 0.5,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 16),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      color: Color.fromARGB(55, 201, 128, 243),
                                      child: Icon(
                                        Icons.person_2_rounded,
                                        color: Color(0xFFC980F3),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, left: 12),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 6),
                                        child: Text(
                                          'Akun Kasir',
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12),
                                        ),
                                      ),
                                      Text(
                                        'Kelola akun kasir ',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: const Color.fromARGB(
                                                163, 0, 0, 0),
                                            fontSize: 11),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 18),
                              child: Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: const Color.fromARGB(130, 0, 0, 0),
                                size: 12.5,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
