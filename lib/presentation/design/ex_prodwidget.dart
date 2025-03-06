import 'package:flutter/material.dart';
import 'package:kasmini_app/presentation/design/home/product/card_product_widget.dart';

class ExProdwidget extends StatelessWidget {
  const ExProdwidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Mengambil ukuran layar
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(
            16.0), // Memberikan padding untuk mencegah overflow
        child: LayoutBuilder(
          builder: (context, constraints) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: screenWidth < 600
                    ? 2
                    : 4, // Responsif berdasarkan ukuran layar
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio:
                    20, // Rasio untuk menyesuaikan tinggi dan lebar kartu
              ),
              itemCount: 6, // Jumlah item
              itemBuilder: (context, index) {
                return CardProductWidget();
              },
            );
          },
        ),
      ),
    );
  }
}