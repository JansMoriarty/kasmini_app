import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrintResiPage extends StatefulWidget {
  const PrintResiPage({super.key});

  @override
  State<PrintResiPage> createState() => _PrintResiPageState();
}

class _PrintResiPageState extends State<PrintResiPage> {
  String selectedEkspedisi = 'Pilih Ekspedisi'; // Placeholder awal

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            // Gambar di posisi paling atas
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: SizedBox(
                width: double.infinity,
                child: Image.asset(
                  '../assets/images/pfp.jpeg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            // Tombol Back dengan Icon di sudut kiri atas gambar
            Positioned(
              top: 20,
              left: 16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back,
                        color: Color.fromARGB(255, 255, 255, 255), size: 22),
                    onPressed: () {
                      Navigator.pop(context);
                      // Aksi saat tombol back ditekan
                    },
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'Cetak Resi',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontSize: 20),
                  ),
                ],
              ),
            ),
            // Container putih
            Positioned(
              top: 240,
              bottom: 0,
              left: 0,
              right: 0,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
                child: SingleChildScrollView(
                  child: Container(
                    color: const Color.fromARGB(255, 234, 240, 255),
                    height: 700,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 28, vertical: 44),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Ekspedisi',
                            style: TextStyle(
                                fontSize: 14,
                                color: Color.fromARGB(126, 0, 0, 0),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 12),
                          GestureDetector(
                            onTap: () {
                              // Menampilkan modal untuk memilih ekspedisi
                              showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      // AppBar untuk modal
                                      Container(
                                        color: Color(0xff5755fe),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 16, horizontal: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              'Pilih Ekspedisi',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontFamily: 'Poppins',
                                              ),
                                            ),
                                            IconButton(
                                              icon: const Icon(Icons.close,
                                                  color: Colors.white),
                                              onPressed: () {
                                                Navigator.pop(
                                                    context); // Menutup modal
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      // Daftar ekspedisi dengan container biru
                                      Container(
                                        padding: const EdgeInsets.all(16),
                                        child: Column(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  selectedEkspedisi = 'JNE';
                                                });
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(12),
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8),
                                                decoration: BoxDecoration(
                                                  color: Color(0xffd9d9d9),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: const Center(
                                                  child: Text(
                                                    'JNE',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Color.fromARGB(
                                                          255, 100, 100, 100),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: 'Poppins',
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  selectedEkspedisi = 'J&T';
                                                });
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(12),
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8),
                                                decoration: BoxDecoration(
                                                  color: Color(0xffd9d9d9),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: const Center(
                                                  child: Text(
                                                    'J&T',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Color.fromARGB(
                                                          255, 100, 100, 100),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: 'Poppins',
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  selectedEkspedisi = 'SiCepat';
                                                });
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(12),
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8),
                                                decoration: BoxDecoration(
                                                  color: Color(0xffd9d9d9),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: const Center(
                                                  child: Text(
                                                    'SiCepat',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Color.fromARGB(
                                                          255, 100, 100, 100),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: 'Poppins',
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  selectedEkspedisi =
                                                      'Pos Indonesia';
                                                });
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(12),
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8),
                                                decoration: BoxDecoration(
                                                  color: Color(0xffd9d9d9),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: const Center(
                                                  child: Text(
                                                    'Pos Indonesia',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Color.fromARGB(
                                                          255, 100, 100, 100),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: 'Poppins',
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Container(
                                height: 50,
                                color: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 14),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      selectedEkspedisi,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.black54,
                                          fontFamily: 'Poppins'),
                                    ),
                                    const Icon(Icons.arrow_drop_down,
                                        color: Colors.black54),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 34),
                          Text(
                            'Barcode / Qrcode',
                            style: TextStyle(
                                fontSize: 14,
                                color: const Color.fromARGB(126, 0, 0, 0),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 12),
                          // NAMA TOKO
                          Row(
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: InputBorder.none,
                                    ),
                                    maxLines: 1,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                  width: 8), // Jarak antara TextField dan ikon
                              InkWell(
                                onTap: () {
                                  // Aksi untuk scan QR Code
                                  print('Scan QR Code di sini');
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xff5755fe),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  padding: const EdgeInsets.all(12),
                                  child: Icon(
                                    Icons.qr_code_scanner_rounded,
                                    size: 24,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(
                            height: 34,
                          ),

                          Text(
                            'Nama Pembeli',
                            style: TextStyle(
                                fontSize: 14,
                                color: const Color.fromARGB(126, 0, 0, 0),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 12),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: TextField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: InputBorder.none,
                              ),
                              maxLines: 1,
                            ),
                          ),

                          SizedBox(
                            height: 34,
                          ),
                          Text(
                            'Keterangan',
                            style: TextStyle(
                                fontSize: 14,
                                color: const Color.fromARGB(126, 0, 0, 0),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 12),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: TextField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: InputBorder.none,
                              ),
                              maxLines: 4,
                            ),
                          ),
                          // Tambahkan elemen lain di bawah sini
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Tombol "SELESAI" dengan posisi fixed
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: GestureDetector(
                onTap: () {
                  // Aksi tombol SELESAI
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Container(
                    height: 50,
                    color: const Color(0xff5755fe),
                    child: const Center(
                      child: Text(
                        'CETAK RESI',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const PrintResiPage());
}
