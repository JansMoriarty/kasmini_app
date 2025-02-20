import 'package:flutter/material.dart';
import 'package:kasmini_app/domain/entities/kasir.dart';
import 'package:kasmini_app/presentation/views/account/edit_akun.dart';

class CardAccountWidget extends StatelessWidget {
  final Kasir kasir;

  const CardAccountWidget({
    super.key,
    required this.kasir,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => EditAkun()));
      },
      child: Container(
        height: 90,
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
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(
                  '../assets/images/avatar1.jpg'), // Ganti dengan path gambar Anda
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  kasir.nama,
                  style: TextStyle(
                      color: Color.fromARGB(255, 57, 57, 57),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins'),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      kasir.noHp ?? '-',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '|',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      kasir.role,
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontFamily: 'Poppins'),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
