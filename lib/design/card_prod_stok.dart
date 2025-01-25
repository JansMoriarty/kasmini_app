import 'package:flutter/material.dart';
import 'package:kasmini_app/page/add_stok.dart';

class ExProdwidget extends StatelessWidget {
  const ExProdwidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Mengambil ukuran layar
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold();
  }
}

class CardProdStok extends StatelessWidget {
  const CardProdStok({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Mengambil ukuran layar
    final screenWidth = MediaQuery.of(context).size.width;

    // Menentukan ukuran responsif untuk kartu
    final cardWidth = screenWidth * 0.4; // 40% dari lebar layar
    final imageHeight =
        cardWidth * 1.2; // Rasio tinggi gambar terhadap lebar kartu

    return Center(
      child: GestureDetector(
        child: Container(
          width: cardWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddStok()));
                  },
                  child: Container(
                    width: cardWidth,
                    height: imageHeight,
                    color: const Color(0xfff0f0f0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Image.asset(
                        'assets/images/gitar.png',
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Fender Stratocast Red Ginsom ',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: 14),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Rp. 1.900.000',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          '290(s).',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 10,
                          ),
                        ),
                      ],
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
