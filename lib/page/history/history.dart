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

class History extends StatelessWidget {
  const History({super.key});

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
                          'Riwayat Transaksi',
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
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Container(
                                width: 100,
                                height: 40,
                                color: const Color(0xff5755fe),
                                child: Center(
                                  child: Text(
                                    'Selesai',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Poppins',
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => BelumLunas()));
                              },
                              child: Container(
                                width: 110,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                      color: const Color(0xffd9d9d9)),
                                ),
                                child: Center(
                                  child: const Text(
                                    'Belum Lunas',
                                    style: TextStyle(
                                      color: Color(0xff979797),
                                      fontFamily: 'Poppins',
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => BelumBayar()));
                              },
                              child: Container(
                                width: 110,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                      color: const Color(0xffd9d9d9)),
                                ),
                                child: Center(
                                  child: const Text(
                                    'Belum Bayar',
                                    style: TextStyle(
                                      color: Color(0xff979797),
                                      fontFamily: 'Poppins',
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Batal()));
                              },
                              child: Container(
                                width: 110,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                      color: Color.fromARGB(95, 201, 37, 37)),
                                ),
                                child: Center(
                                  child: const Text(
                                    'Dibatalkan',
                                    style: TextStyle(
                                      color: Color.fromARGB(99, 201, 37, 37),
                                      fontFamily: 'Poppins',
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
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
                      const SizedBox(height: 20),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HistoryDetail()));
                          },
                          child: CardHistory()),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
