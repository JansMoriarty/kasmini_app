import 'package:flutter/material.dart';

class CardProduct extends StatelessWidget {
  const CardProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24), topRight: Radius.circular(24)),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Image.asset('assets/images/gitar.png'),
                ),
                width: 170,
                height: 180,
                color: const Color(0xfff0f0f0),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24)),
              child: Container(
                // ignore: sort_child_properties_last
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 100,
                        child: Text(
                          'Fender Stratocast Red ',
                          style: TextStyle(fontFamily: 'Poppins', fontSize: 10),
                        ),
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Rp. 1.900.000',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                fontSize: 10),
                          ),
                          Text(
                            '290(s).',
                            style:
                                TextStyle(fontFamily: 'Poppins', fontSize: 10),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                width: 170,
                height: 90,
                color: const Color(0xfff9f9f9),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
