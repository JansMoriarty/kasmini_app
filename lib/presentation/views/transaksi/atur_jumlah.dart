import 'package:flutter/material.dart';
import 'package:kasmini_app/presentation/views/home_view.dart';
import 'package:kasmini_app/presentation/views/pilih_prod.dart';
import 'package:kasmini_app/presentation/views/success.dart';
import 'package:kasmini_app/presentation/views/transaksi/checkout.dart';

class AturJumlah extends StatefulWidget {
  const AturJumlah({super.key});

  @override
  _AddStokState createState() => _AddStokState();
}

class _AddStokState extends State<AturJumlah> {
  int count = 1; // This will hold the value of the count

  // Function to decrement the count
  void decrement() {
    setState(() {
      if (count > 0) {
        count--;
      }
    });
  }

  // Function to increment the count
  void increment() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double containerHeight = screenWidth > 400 ? 185 : 160;
    double imageSize = screenWidth > 400 ? 100 : 80;
    double fontSize = screenWidth > 400 ? 16 : 14;

    return Scaffold(
      body: Container(
        height: double.infinity,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: SingleChildScrollView(
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
                      'Atur Transaksi',
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
                  height: 34,
                ),
                Container(
                  width: double.infinity,
                  height: 165,
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
                        padding: const EdgeInsets.only(
                            top: 20, bottom: 55, left: 20, right: 20),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Image.asset('assets/images/gitar.png'),
                                ),
                                width: 80,
                                height: double.maxFinite,
                                color: const Color.fromARGB(255, 231, 231, 231),
                              ),
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 4),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Fender Stratocast Red',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        fontSize: fontSize + 1,
                                        color:
                                            const Color.fromARGB(159, 0, 0, 0),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      'Stok    : 290',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color:
                                            Color.fromARGB(255, 137, 137, 137),
                                        fontSize: fontSize - 2,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Text(
                                      'Rp. 1.900.000,00',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: fontSize - 2,
                                        color:
                                            const Color.fromARGB(148, 0, 0, 0),
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
                        right: 10,
                        bottom: 10,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: decrement, // Decrement function
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
                              '$count', // Display the current count
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: fontSize,
                              ),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            IconButton(
                              onPressed: increment, // Increment function
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
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 90,
        child: Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 13,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6)),
                          fixedSize: Size(double.maxFinite, 50),
                          elevation: 0,
                          backgroundColor: const Color(0xff5755fe),
                          shadowColor: Colors.transparent,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Checkout()),
                          );
                        },
                        child: Text(
                          'Checkout',
                          style: TextStyle(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              fontFamily: 'Poppins'),
                        ),
                      ),
                    ),
                    SizedBox(width: 8), // Jarak antar tombol
                    Expanded(
                      flex: 7,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6)),
                          fixedSize: Size(double.maxFinite, 50),
                          elevation: 0,
                          side: BorderSide(color: Color(0xff5755fe), width: 2),
                          backgroundColor:
                              const Color.fromARGB(255, 255, 255, 255),
                          shadowColor: Colors.transparent,
                        ),
                        onPressed: () {
                          // Logika untuk tombol Tambah Barang
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PilihProd()));
                        },
                        child: Text(
                          'Tambah',
                          style: TextStyle(
                              color: const Color(0xff5755fe),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600),
                        ),
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
