import 'package:flutter/material.dart';
import 'package:kasmini_app/presentation/design/card_prod_stok.dart';
import 'package:kasmini_app/presentation/design/card_transaksi.dart';
import 'package:kasmini_app/presentation/design/ex_prodwidget.dart';
import 'package:kasmini_app/presentation/views/add_prod.dart';
import 'package:kasmini_app/presentation/views/home_view.dart';
import 'package:kasmini_app/presentation/views/kategori.dart';

class MainTransaksi extends StatelessWidget {
  const MainTransaksi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 255, 255, 255),
        width: double.infinity, // Mengisi seluruh lebar layar
        height: double.infinity, // Mengisi seluruh tinggi layar
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 28),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Transaksi',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Poppins',
                            color: const Color.fromARGB(185, 0, 0, 0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
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
                          IconButton(
                            onPressed: () {
                              // Logika untuk Filter
                              debugPrint("Filter pressed");
                            },
                            icon: const Icon(Icons.filter_list),
                          ),
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

                      // Mengganti Row dengan GridView.builder
                      GridView.builder(
                        shrinkWrap: true, // Penting untuk mencegah overflow
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Dua kolom horizontal
                          crossAxisSpacing: 8, // Spasi horizontal antar kartu
                          mainAxisSpacing: 18, // Spasi vertikal antar kartu
                          childAspectRatio: 2.2 / 4, // Rasio aspek untuk kartu
                        ),
                        itemCount: 3, // Jumlah item yang ingin ditampilkan
                        itemBuilder: (context, index) {
                          return CardTransaksi(); // Widget untuk setiap kartu
                        },
                      ),
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
