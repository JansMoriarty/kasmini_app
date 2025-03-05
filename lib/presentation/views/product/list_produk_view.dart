import 'package:flutter/material.dart';
import 'package:kasmini_app/presentation/app_theme.dart';
import 'package:kasmini_app/presentation/design/ex_prodwidget.dart';
import 'package:kasmini_app/presentation/design/home/product/card_product_widget.dart';
import 'package:kasmini_app/presentation/pages/main_page.dart';
import 'package:kasmini_app/presentation/views/add_prod.dart';
import 'package:kasmini_app/presentation/views/kategori.dart';

class ListProdukView extends StatelessWidget {
  const ListProdukView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + 20,
            bottom: 20,
            left: 20,
            right: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 25,
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Produk',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          color: const Color.fromARGB(185, 0, 0, 0),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MainPage(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 15,
                  children: [
                    Row(
                      spacing: 15,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: AppTheme.primaryColor,
                            ),
                            child: Center(
                              child: Text(
                                'Produk',
                                style: AppTheme.textTheme.bodySmall?.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Kategori(),
                                ),
                              );
                            },
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: AppTheme.grayOutlineColor,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'Kategori',
                                  style: AppTheme.textTheme.bodySmall?.copyWith(
                                    color: AppTheme.secondaryTextColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      spacing: 15,
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: const BorderSide(
                                  color: AppTheme.grayOutlineColor,
                                  width: 1,
                                ),
                              ),
                              // focusedBorder: OutlineInputBorder(
                              //   borderRadius: BorderRadius.circular(12.0),
                              //   borderSide: const BorderSide(
                              //     color: Color(0xffd9d9d9),
                              //     width: 2,
                              //   ),
                              // ),
                              hintText: 'Search',
                              hintStyle: AppTheme.textTheme.bodySmall?.copyWith(
                                color: AppTheme.secondaryTextColor,
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.filter_list),
                        ),
                        PopupMenuButton<String>(
                          onSelected: (value) {
                            debugPrint("Selected: $value");
                          },
                          color: Color(0xff5755fe),
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
                                          color: Color(0xff5755fe),
                                          size: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "A - Z",
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color:
                                            Color.fromARGB(255, 255, 255, 255)),
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
                                          color: Color(0xff5755fe),
                                          size: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "Z - A",
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            PopupMenuItem(
                              value: "Stok1",
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Container(
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(2),
                                        child: Icon(
                                          Icons.trending_up_rounded,
                                          color: Color(0xff5755fe),
                                          size: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "Stok",
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            PopupMenuItem(
                              value: "Stok2",
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Container(
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(2),
                                        child: Icon(
                                          Icons.trending_down_rounded,
                                          color: Color(0xff5755fe),
                                          size: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "Stok",
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ],
                          icon: const Icon(Icons.sort),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Mengganti Row dengan GridView.builder
              GridView.builder(
                shrinkWrap: true, // Penting untuk mencegah overflow
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Dua kolom horizontal
                  crossAxisSpacing: 12, // Spasi horizontal antar kartu
                  mainAxisSpacing: 20, // Spasi vertikal antar kartu
                  childAspectRatio: 2.2 / 4, // Rasio aspek untuk kartu
                ),
                itemCount: 3, // Jumlah item yang ingin ditampilkan
                itemBuilder: (context, index) {
                  return CardProd(); // Widget untuk setiap kartu
                },
              ),
            ],
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
                      MaterialPageRoute(builder: (context) => AddProd()),
                    );
                  },
                  child: Text(
                    'Tambah Produk',
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
