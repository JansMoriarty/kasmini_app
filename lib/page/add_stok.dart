import 'package:flutter/material.dart';
import 'package:kasmini_app/page/home.dart';

class AddStok extends StatefulWidget {
  const AddStok({super.key});

  @override
  _AddStokState createState() => _AddStokState();
}

class _AddStokState extends State<AddStok> {
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
      body: Padding(
        padding: EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            width: double.maxFinite,
            height: double.maxFinite,
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
                      'Tambah Stok',
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
                  height: 28,
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
                                      'Mie Goreng',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        fontSize: fontSize + 1,
                                        color:
                                            const Color.fromARGB(159, 0, 0, 0),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      'Stok    : 12',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color:
                                            Color.fromARGB(255, 137, 137, 137),
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
                                        color:
                                            const Color.fromARGB(201, 0, 0, 0),
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
                SizedBox(
                  height: 14,
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
                                      'Mie Sedaap Cup',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        fontSize: fontSize + 1,
                                        color:
                                            const Color.fromARGB(159, 0, 0, 0),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      'Stok    : 12',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color:
                                            Color.fromARGB(255, 137, 137, 137),
                                        fontSize: fontSize,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      'Rp. 6.000,00',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: fontSize,
                                        color:
                                            const Color.fromARGB(201, 0, 0, 0),
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
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Icon(
                    Icons.add_circle_rounded,
                    color: Color(0xff5755fe),
                    size: 70,
                  ),
                )
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
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  child: Text(
                    'Simpan',
                    style: TextStyle(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        fontFamily: 'Poppins'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
