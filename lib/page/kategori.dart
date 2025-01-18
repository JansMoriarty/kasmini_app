import 'package:flutter/material.dart';
import 'package:kasmini_app/page/example_prod.dart';
import 'package:kasmini_app/page/home.dart';
import 'package:lottie/lottie.dart';

class Kategori extends StatefulWidget {
  const Kategori({super.key});

  @override
  _KategoriState createState() => _KategoriState();
}

class _KategoriState extends State<Kategori> {
  List<String> categories = []; // List to store categories

  // Function to show modal for adding category
  void _showAddCategoryModal() {
    TextEditingController categoryController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Tambah Kategori',
                  style: TextStyle(fontSize: 20, fontFamily: 'Poppins'),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: categoryController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 255, 0, 0)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (categoryController.text.isNotEmpty) {
                      setState(() {
                        categories.add(categoryController.text);
                      });
                      Navigator.pop(context);
                    }
                  },
                  child: Text('Simpan'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Function to delete category
  void _deleteCategory(int index) {
    setState(() {
      categories.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 255, 255, 255),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
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
                                  builder: (context) => HomePage()));
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 28),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Product()));
                            },
                            child: Container(
                              width: 100,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border:
                                    Border.all(color: const Color(0xffd9d9d9)),
                              ),
                              child: Center(
                                child: const Text(
                                  'Produk',
                                  style: TextStyle(
                                    color: Color(0xff979797),
                                    fontFamily: 'Poppins',
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 12),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                              width: 110,
                              height: 40,
                              color: const Color(0xff5755fe),
                              child: Center(
                                child: Text(
                                  'Kategori',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Poppins',
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 22, vertical: 8),
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
                      const SizedBox(height: 28),
                      categories.isEmpty
                          ? Container(
                              height: 480,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Lottie.asset('../assets/lottie/nofound.json',
                                      width: 170, height: 170),
                                  SizedBox(height: 18),
                                  Text(
                                    'No data found.',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xffd9d9d9)),
                                  ),
                                ],
                              ),
                            )
                          : Column(
                              children: categories.map((category) {
                                int index = categories.indexOf(category);
                                return Container(
                                  decoration: BoxDecoration(
                                    color: Colors
                                        .white, // Warna background Container
                                    borderRadius: BorderRadius.circular(
                                        12), // Untuk sudut yang melengkung
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            const Color.fromARGB(19, 0, 0, 0),
                                        spreadRadius: 1,
                                        blurRadius: 3,
                                        offset: Offset(0, 1),
                                      ),
                                    ],
                                  ),
                                  margin: const EdgeInsets.only(bottom: 16),
                                  child: ListTile(
                                    title: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 20),
                                      child: Text(
                                        category,
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: const Color.fromARGB(
                                                255, 143, 143, 143)),
                                      ),
                                    ),
                                    trailing: IconButton(
                                      icon: Icon(
                                        Icons.delete,
                                        size: 28,
                                        color: const Color.fromARGB(
                                            206, 255, 7, 7),
                                      ),
                                      onPressed: () {
                                        _deleteCategory(index);
                                      },
                                    ),
                                  ),
                                );
                              }).toList(),
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
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                    fixedSize: Size(double.maxFinite, 50),
                    elevation: 0,
                    backgroundColor: const Color(0xff5755fe),
                    shadowColor: Colors.transparent,
                  ),
                  onPressed: _showAddCategoryModal,
                  child: Text(
                    'Tambah Kategori',
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
