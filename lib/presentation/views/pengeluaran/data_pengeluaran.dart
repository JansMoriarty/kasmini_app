import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kasmini_app/presentation/views/pengeluaran/pengeluaran.dart';

class DataPengeluaran extends StatefulWidget {
  const DataPengeluaran({super.key});

  @override
  State<DataPengeluaran> createState() => _DataPengeluaranState();
}

class _DataPengeluaranState extends State<DataPengeluaran> {
  TextEditingController nominalController = TextEditingController();
  TextEditingController tanggalController = TextEditingController();

  // Untuk memilih tanggal
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      setState(() {
        tanggalController.text = "${pickedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            // Gambar di posisi paling atas
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: SizedBox(
                width: double.infinity,
                child: Image.asset(
                  '../assets/images/pfp.jpeg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            // Tombol Back dengan Icon di sudut kiri atas gambar
            Positioned(
              top: 20,
              left: 16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back,
                        color: Color.fromARGB(255, 255, 255, 255), size: 22),
                    onPressed: () {
                      Navigator.pop(context);
                      // Aksi saat tombol back ditekan
                    },
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'Data Pengeluaran',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontSize: 20),
                  ),
                ],
              ),
            ),
            // Container putih
            Positioned(
              top: 240,
              bottom: 0,
              left: 0,
              right: 0,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
                child: SingleChildScrollView(
                  child: Container(
                    color: const Color.fromARGB(255, 234, 240, 255),
                    height: 600,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 28, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 34),
                          Text(
                            'Nama Pengeluaran',
                            style: TextStyle(
                                fontSize: 14,
                                color: const Color.fromARGB(126, 0, 0, 0),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 12),
                          // NAMA TOKO
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: TextField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: InputBorder.none,
                              ),
                              maxLines: 1,
                            ),
                          ),

                          SizedBox(
                            height: 34,
                          ),

                          Text(
                            'Nominal',
                            style: TextStyle(
                                fontSize: 14,
                                color: const Color.fromARGB(126, 0, 0, 0),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 12),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: TextField(
                              controller: nominalController,
                              keyboardType: TextInputType.number, // Hanya angka
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: InputBorder.none,
                                prefixText: 'Rp. ', // Text "Rp." di-lock
                              ),
                              maxLines: 1,
                            ),
                          ),

                          SizedBox(
                            height: 34,
                          ),
                          Text(
                            'Tanggal Pengeluaran',
                            style: TextStyle(
                                fontSize: 14,
                                color: const Color.fromARGB(126, 0, 0, 0),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 12),
                          GestureDetector(
                            onTap: () =>
                                _selectDate(context), // Menampilkan DatePicker
                            child: AbsorbPointer(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: TextField(
                                  controller: tanggalController,
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: InputBorder.none,
                                      hintText: 'Pilih Tanggal',
                                      hintStyle: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 13,
                                          color: const Color.fromARGB(
                                              255, 129, 129, 129)),
                                      suffixIcon: Icon(Icons.arrow_right)),
                                  maxLines: 1,
                                ),
                              ),
                            ),
                          ),
                          // Tambahkan elemen lain di bawah sini
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Tombol "SELESAI" dengan posisi fixed
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Pengeluaran()));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Container(
                    height: 50,
                    color: const Color(0xff5755fe),
                    child: const Center(
                      child: Text(
                        'SIMPAN',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Poppins'),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const DataPengeluaran());
}
