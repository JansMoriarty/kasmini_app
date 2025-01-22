import 'package:flutter/material.dart';

class Transaksi extends StatelessWidget {
  const Transaksi({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 160,
        margin: const EdgeInsets.all(0), // Margin luar kartu
        padding: const EdgeInsets.all(20), // Padding dalam kartu
        decoration: BoxDecoration(
          color: Colors.white, // Warna background kartu
          borderRadius: BorderRadius.circular(16), // Sudut membulat
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(56, 0, 0, 0),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Ikon kartu
                Column(
                  children: [
                    const Text(
                      '12 Jan, 2025',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 12,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE8F5E9), // Background hijau muda
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.credit_card,
                        size: 38,
                        color: Colors.green, // Ikon berwarna hijau
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 16),
                // Detail informasi
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Tanggal dan jam
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Yayat Ruhiyat,',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.access_time_rounded,
                                  color:
                                      const Color.fromARGB(255, 111, 111, 111),
                                  size: 16,
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                                const Text(
                                  '19.23',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Poppins',
                                    color: Color.fromARGB(255, 122, 122, 122),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        // Nama dan harga

                        // Status pembayaran

                        Text(
                          'Jumlah Pesanan   : 2',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 12,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Total Profit   : Rp. 20.000',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 12,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        const SizedBox(height: 18),
                        // Nama produk
                        SizedBox(
                          width: 200,
                          child: const Text(
                            'Total Pembayaran   :  Rp. 190.000',
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
                ),
              ],
            ),
            // Tombol hapus di kanan bawah
          ],
        ),
      ),
    );
  }
}
