import 'package:flutter/material.dart';
import 'package:kasmini_app/page/success.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Text(
                  'Checkout',
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      color: const Color.fromARGB(185, 0, 0, 0)),
                ),
                Container(
                  width: 25,
                  height: 10,
                ),
              ],
            ),
            SizedBox(
              height: 24,
            ),
            Container(
              width: double.infinity,
              height: 115,
              margin: const EdgeInsets.all(0), // Margin luar kartu
              padding: const EdgeInsets.all(18), // Padding dalam kartu
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
                          color: const Color.fromARGB(255, 200, 200, 200),
                          thickness: 0.7,
                        ),
                        Text(
                          '1 x 190.000',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              color: const Color.fromARGB(255, 163, 163, 163),
                              fontSize: 10),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total   :',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color:
                                      const Color.fromARGB(255, 163, 163, 163),
                                  fontSize: 12),
                            ),
                            Text(
                              'Rp. 190.000,00',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Poppins',
                                  color:
                                      const Color.fromARGB(255, 163, 163, 163),
                                  fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Container(
              width: double.infinity,
              height: 95,
              margin: const EdgeInsets.all(0), // Margin luar kartu
              padding: const EdgeInsets.all(18), // Padding dalam kartu
              decoration: BoxDecoration(
                color: Color(0xff5755fe), // Warna background kartu
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
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Subtotal    :',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 13,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                            const Text(
                              'Rp. 190.000,00',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 13,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 1),
                        Divider(
                          color: const Color.fromARGB(255, 220, 220, 220),
                          thickness: 0.7,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Profit   :',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 12),
                            ),
                            Text(
                              'Rp. 40.000',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Poppins',
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 14),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        color: Colors.red,
        height: 70,
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
                        backgroundColor: Color(0xff5755fe),
                        shadowColor: Colors.transparent,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SuccessPage()));
                        // Aksi untuk tombol pertama
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.shopping_cart,
                            color: Colors.white,
                            size: 20,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          const Text(
                            'Bayar',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Color.fromARGB(255, 255, 255, 255),
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
