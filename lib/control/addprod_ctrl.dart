import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/services.dart';

class AddProd extends StatefulWidget {
  @override
  _AddProdState createState() => _AddProdState();
}

class _AddProdState extends State<AddProd> {
  String? _storeImagePath;
  final TextEditingController _hargaBeliController = TextEditingController();
  final TextEditingController _hargaJualController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Listener untuk menghitung harga jual secara otomatis
    _hargaBeliController.addListener(() {
      final String hargaBeliText = _hargaBeliController.text;
      if (hargaBeliText.isNotEmpty) {
        final int hargaBeli = int.tryParse(hargaBeliText.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
        final int hargaJual = (hargaBeli * 1.2).round(); // Tambah 20%
        _hargaJualController.text = hargaJual.toString();
      } else {
        _hargaJualController.clear();
      }
    });
  }

  @override
  void dispose() {
    _hargaBeliController.dispose();
    _hargaJualController.dispose();
    super.dispose();
  }

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _storeImagePath = pickedFile.path;
      });
    }
  }

  void _showImagePickerModal() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Wrap(
              children: [
                ListTile(
                  leading: Icon(Icons.camera_alt),
                  title: Text('Pilih dari Kamera'),
                  onTap: () {
                    Navigator.pop(context);
                    _pickImage(ImageSource.camera);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.photo),
                  title: Text('Pilih dari Galeri'),
                  onTap: () {
                    Navigator.pop(context);
                    _pickImage(ImageSource.gallery);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Tambah Produk',
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Poppins',
                              color: const Color.fromARGB(185, 0, 0, 0)),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: _storeImagePath != null
                          ? FileImage(File(_storeImagePath!))
                          : AssetImage('../assets/images/pfp.jpg')
                              as ImageProvider,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: _showImagePickerModal,
                        child: CircleAvatar(
                          radius: 16,
                          backgroundColor: Color(0xff5755fe),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 36),
              Container(
                color: const Color(0xffF1F4FB),
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Harga Beli',
                        style: TextStyle(
                            fontSize: 14,
                            color: const Color.fromARGB(126, 0, 0, 0),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 12),
                      TextField(
                        controller: _hargaBeliController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        decoration: InputDecoration(
                          prefixText: 'Rp. ',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      SizedBox(height: 28),
                      Text(
                        'Harga Jual',
                        style: TextStyle(
                            fontSize: 14,
                            color: const Color.fromARGB(126, 0, 0, 0),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 12),
                      TextField(
                        controller: _hargaJualController,
                        enabled: false,
                        decoration: InputDecoration(
                          prefixText: 'Rp. ',
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      SizedBox(height: 38),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          fixedSize: Size(double.maxFinite, 50),
          backgroundColor: const Color(0xff5755fe),
        ),
        onPressed: () {
          print('Harga Beli: ${_hargaBeliController.text}');
          print('Harga Jual: ${_hargaJualController.text}');
        },
        child: Text('Simpan',
            style: TextStyle(
                color: const Color.fromARGB(255, 255, 255, 255),
                fontSize: 16)),
      ),
    );
  }
}
