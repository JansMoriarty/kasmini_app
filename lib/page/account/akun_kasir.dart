import 'package:flutter/material.dart';
import 'package:kasmini_app/design/card_account.dart';
import 'package:kasmini_app/main_page.dart';

class AkunKasir extends StatelessWidget {
  const AkunKasir({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              // Berikan ukuran eksplisit pada Stack
              SizedBox(
                height: 80, // Ukuran yang sesuai untuk area Stack
                child: Stack(
                  children: [
                    Positioned(
                      top: 20,
                      left: 16,
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Color.fromARGB(255, 149, 149, 149),
                              size: 22,
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const MainPage()));
                            },
                          ),
                          const SizedBox(width: 12),
                          const Text(
                            'Akun Kasir',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Color.fromARGB(255, 135, 135, 135),
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(
                              color: Color(0xffd9d9d9),
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(
                              color: Color(0xffd9d9d9),
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(
                              color: Color(0xffd9d9d9),
                              width: 2,
                            ),
                          ),
                          hintText: 'Search',
                          hintStyle: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 13,
                            color: Color(0xff979797),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    PopupMenuButton<String>(
                      onSelected: (value) {
                        debugPrint("Selected: $value");
                      },
                      color: const Color(0xff5755fe),
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          value: "A-Z",
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Container(
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: Icon(
                                      Icons.arrow_upward_rounded,
                                      color: const Color(0xff5755fe),
                                      size: 16,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                "A - Z",
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Color.fromARGB(255, 255, 255, 255)),
                              ),
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          value: "Z-A",
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Container(
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: Icon(
                                      Icons.arrow_downward_rounded,
                                      color: const Color(0xff5755fe),
                                      size: 16,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                "Z - A",
                                style: TextStyle(
                                    fontFamily: 'Poppins', color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                      icon: const Icon(Icons.sort),
                    ),
                  ],
                ),
              ),
              SizedBox( height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: AccountWidget(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
