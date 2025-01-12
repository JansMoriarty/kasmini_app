import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFF5F5F5), // Warna background aplikasi
        body: CardHistory(),
      ),
    );
  }
}

class CardHistory extends StatelessWidget {
  const CardHistory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 145,
        margin: const EdgeInsets.all(0), // Margin luar kartu
        padding: const EdgeInsets.all(20), // Padding dalam kartu
        decoration: BoxDecoration(
          color: Colors.white, // Warna background kartu
          borderRadius: BorderRadius.circular(16), // Sudut membulat
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Ikon kartu
                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8F5E9), // Background hijau muda
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.credit_card,
                    size: 32,
                    color: Colors.green, // Ikon berwarna hijau
                  ),
                ),
                const SizedBox(width: 16),
                // Detail informasi
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Tanggal dan jam
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            '12 Jan, 12:57',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 12,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          const Text(
                            'Rp. 190.000',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      // Nama dan harga
                      const Text(
                        'Yayat Ruhiyat,',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      const SizedBox(height: 6),
                      // Status pembayaran
                      Row(
                        children: const [
                          Icon(
                            Icons.check_circle,
                            size: 16,
                            color: Colors.green,
                          ),
                          SizedBox(width: 6),
                          Text(
                            'Pembayaran Selesai',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 12,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      // Nama produk
                      SizedBox(
                        width: 130,
                        child: const Text(
                          '1 GITAR FENDER STRATOC',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            overflow: TextOverflow.ellipsis, // Potongan teks
                          ),
                          maxLines: 1, // Maksimal 1 baris teks
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // Tombol hapus di kanan bawah
            Positioned(
              bottom: 0,
              right: 0,
              child: IconButton(
                onPressed: () {
                  // Aksi ketika tombol hapus ditekan
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
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
  runApp(const CustomCard());
}
