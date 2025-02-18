import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kasmini_app/presentation/views/main_view.dart';

class EditAkun extends StatefulWidget {
  const EditAkun({super.key});

  @override
  _EditAkunState createState() => _EditAkunState();
}

class _EditAkunState extends State<EditAkun> {
  // Menyimpan gambar avatar yang dipilih
  String avatarImagePath = '../assets/images/male_owner.jpg';

  // Fungsi untuk menampilkan Modal Bottom Sheet pemilihan gambar
  void _showImagePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white, // Modal background putih
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // AppBar-like Container dengan tombol silang di kanan
            Container(
              color: Color(0xff5755fe),
              padding:
                  const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Pilih Gambar',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context); // Menutup modal
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 38),
            // Gambar-gambar avatar dalam Row
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        avatarImagePath =
                            '../assets/images/avatar_male.jpg'; // Ganti dengan path avatar 1
                      });
                      Navigator.pop(context);
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        '../assets/images/avatar_male.jpg',
                        width: 70,
                        height: 70,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        avatarImagePath =
                            '../assets/images/avatar_female.jpg'; // Ganti dengan path avatar 2
                      });
                      Navigator.pop(context);
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        '../assets/images/avatar_female.jpg',
                        width: 70,
                        height: 70,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        avatarImagePath =
                            '../assets/images/male_owner.jpg'; // Ganti dengan path avatar 2
                      });
                      Navigator.pop(context);
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        '../assets/images/male_owner.jpg',
                        width: 70,
                        height: 70,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        avatarImagePath =
                            '../assets/images/female_owner.jpg'; // Ganti dengan path avatar 2
                      });
                      Navigator.pop(context);
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        '../assets/images/female_owner.jpg',
                        width: 70,
                        height: 70,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              // Header
              SizedBox(
                height: 80,
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
                              Navigator.pop(context);
                            },
                          ),
                          const SizedBox(width: 12),
                          const Text(
                            'Edit Kasir',
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

              // Avatar dan Edit Gambar
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                child: Column(
                  children: [
                    Row(
                      children: [
                        // Avatar Circle
                        CircleAvatar(
                          radius: 32,
                          backgroundImage: AssetImage(avatarImagePath),
                        ),
                        const SizedBox(width: 24),
                        GestureDetector(
                          onTap: () => _showImagePicker(context),
                          child: Container(
                            decoration: BoxDecoration(
                                color: const Color(0xff5755fe),
                                borderRadius: BorderRadius.circular(8)),
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 20),
                            child: const Text(
                              'Edit Gambar',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 34),

                    // Nama Kasir
                    Row(
                      children: const [
                        Icon(
                          Icons.person,
                          color: Color.fromARGB(126, 0, 0, 0),
                        ),
                        SizedBox(width: 6),
                        Text(
                          'Nama Kasir',
                          style: TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(126, 0, 0, 0),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: const TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 233, 233, 233),
                          border: InputBorder.none,
                        ),
                        maxLines: 1,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // No. HP
                    Row(
                      children: const [
                        Icon(
                          Icons.call,
                          color: Color.fromARGB(126, 0, 0, 0),
                        ),
                        SizedBox(width: 6),
                        Text(
                          'No. Hp',
                          style: TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(126, 0, 0, 0),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 233, 233, 233),
                          border: InputBorder.none,
                        ),
                        maxLines: 1,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // PIN Baru
                    Row(
                      children: const [
                        Icon(
                          Icons.lock,
                          color: Color.fromARGB(126, 0, 0, 0),
                        ),
                        SizedBox(width: 6),
                        Text(
                          'PIN Baru',
                          style: TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(126, 0, 0, 0),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        maxLength: 6,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromARGB(255, 233, 233, 233),
                          counterText: "",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
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
                  onPressed: () {},
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
