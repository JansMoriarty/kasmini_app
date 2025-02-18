import 'package:flutter/material.dart';
import 'package:kasmini_app/presentation/design/card_history.dart';
import 'package:kasmini_app/presentation/views/history/history.dart';

class HistoryDetail extends StatelessWidget {
  const HistoryDetail({super.key});

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
                          'Detail Transaksi',
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
                                  builder: (context) => History()));
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
                      CardHistory(),
                      SizedBox(
                        height: 18,
                      ),
                      // card kasir
                      Container(
                        height: 130,
                        margin: const EdgeInsets.all(0), // Margin luar kartu
                        padding:
                            const EdgeInsets.all(20), // Padding dalam kartu
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
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Metode Pembayaran   :',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 12,
                                      color: Color(0xff575757)),
                                ),
                                Text(
                                  'CASH',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Poppins',
                                      fontSize: 12,
                                      color:
                                          Color.fromARGB(255, 125, 125, 125)),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Kasir   :',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 12,
                                      color: Color(0xff575757)),
                                ),
                                Text(
                                  'PAUZAN RIZKY ALAMSYAH',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Poppins',
                                      fontSize: 12,
                                      color:
                                          Color.fromARGB(255, 142, 142, 142)),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Divider(
                              color: const Color.fromARGB(255, 200, 200, 200),
                              thickness: 0.7,
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Bayar   :',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 12,
                                      color: Color(0xff575757)),
                                ),
                                Text(
                                  'Rp. 190.000,00',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Poppins',
                                      fontSize: 12,
                                      color:
                                          Color.fromARGB(255, 139, 139, 139)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 29,
                      ),
                      // tombol edit
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Detail Transaksi',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                color:
                                    const Color.fromARGB(255, 117, 117, 117)),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              color: Color(0xff5755fe),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 45, vertical: 10),
                              child: Text(
                                'Edit',
                                style: TextStyle(
                                    fontFamily: 'Poppins', color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 24),
                      //detail transaksi card
                      Container(
                        width: double.infinity,
                        height: 115,
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
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: const Color(0xffd9d9d9),
                              ),
                              padding: const EdgeInsets.all(8),
                              child: Image.asset('assets/images/gitar.png'),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Fender Stratocaster Red',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromARGB(255, 134, 134, 134),
                                    ),
                                  ),
                                  const SizedBox(height: 1),
                                  Divider(
                                    color: const Color.fromARGB(
                                        255, 200, 200, 200),
                                    thickness: 0.7,
                                  ),
                                  Text(
                                    '1 x 190.000',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: const Color.fromARGB(
                                            255, 163, 163, 163),
                                        fontSize: 10),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Total   :',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: const Color.fromARGB(
                                                255, 163, 163, 163),
                                            fontSize: 12),
                                      ),
                                      Text(
                                        'Rp. 190.000,00',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'Poppins',
                                            color: const Color.fromARGB(
                                                255, 163, 163, 163),
                                            fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
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
        color: Colors.red,
        height: 130,
        child: Container(
          height: 200,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Column(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                        fixedSize: const Size(double.maxFinite, 50),
                        elevation: 0,
                        backgroundColor: const Color.fromARGB(255, 255, 69, 69),
                        shadowColor: Colors.transparent,
                      ),
                      onPressed: () {
                        // Aksi untuk tombol pertama
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.cancel,
                            color: Colors.white,
                            size: 20,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          const Text(
                            'Batalkan Pesanan',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8), // Jarak antar tombol
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                        fixedSize: const Size(double.maxFinite, 50),
                        elevation: 0,
                        backgroundColor:
                            const Color.fromARGB(255, 255, 255, 255),
                        side: BorderSide(
                            color: const Color.fromARGB(255, 255, 69, 69),
                            width: 1.5),
                        shadowColor: Colors.transparent,
                      ),
                      onPressed: () {
                        // Aksi untuk tombol kedua
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.delete,
                            color: const Color.fromARGB(255, 255, 69, 69),
                            size: 20,
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          const Text(
                            'Hapus Pesanan',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: const Color.fromARGB(255, 255, 69, 69),
                            ),
                          ),
                        ],
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
