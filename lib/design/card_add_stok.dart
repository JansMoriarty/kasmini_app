import 'package:flutter/material.dart';

class CardAddStok extends StatefulWidget {
  const CardAddStok({super.key});

  @override
  _CardAddStokState createState() => _CardAddStokState();
}

class _CardAddStokState extends State<CardAddStok> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CardStokAdd(count: count),
    );
  }
}

class CardStokAdd extends StatelessWidget {
  const CardStokAdd({
    super.key,
    required this.count,
  });

  final int count;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double containerHeight = screenWidth > 400 ? 185 : 160;
    double imageSize = screenWidth > 400 ? 100 : 80;
    double fontSize = screenWidth > 400 ? 16 : 14;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          // Wrap with SingleChildScrollView
          child: Container(
            width: double.infinity,
            height: containerHeight,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Color(0xffd9d9d9),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(35, 0, 0, 0),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Container(
                          width: imageSize,
                          height: imageSize * 1.3,
                          color: const Color.fromARGB(255, 231, 231, 231),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10, left: 4),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Mie Goreng',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  fontSize: fontSize + 1,
                                  color: const Color.fromARGB(159, 0, 0, 0),
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                'Stok    : 12',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Color.fromARGB(255, 137, 137, 137),
                                  fontSize: fontSize,
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                'Rp. 190.000,00',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: fontSize,
                                  color: const Color.fromARGB(201, 0, 0, 0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 16,
                  bottom: 10,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          // Add functionality for decrement
                        },
                        icon: Icon(
                          Icons.remove_circle_rounded,
                          color: const Color.fromARGB(255, 193, 193, 193),
                          size: 30,
                        ),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        '$count',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: fontSize,
                        ),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      IconButton(
                        onPressed: () {
                          // Add functionality for increment
                        },
                        icon: Icon(
                          Icons.add_circle_rounded,
                          color: Colors.blue,
                          size: 30,
                        ),
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
