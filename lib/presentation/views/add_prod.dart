import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddProd extends StatefulWidget {
  @override
  _AddProdState createState() => _AddProdState();
}

class _AddProdState extends State<AddProd> {
  String? _storeImagePath;
  final TextEditingController _addressController = TextEditingController();
  String? _selectedProfitOption;
  bool isChecked = false; // Status awal checkbox
  final TextEditingController _hargaBeliController = TextEditingController();
  final TextEditingController _hargaJualController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _hargaBeliController.addListener(() {
      final String hargaBeliText = _hargaBeliController.text;
      if (hargaBeliText.isNotEmpty) {
        final int hargaBeli =
            int.tryParse(hargaBeliText.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
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
              // EDIT FOTO TOKO
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: _storeImagePath != null
                          ? FileImage(File(_storeImagePath!))
                          : AssetImage('../assets/images/placeholder.jpeg')
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
                height: 1000,
                color: const Color(0xffF1F4FB),
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nama Produk',
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
                        'Barcode / Qrcode',
                        style: TextStyle(
                            fontSize: 14,
                            color: const Color.fromARGB(126, 0, 0, 0),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 12),
                      // NAMA TOKO
                      Row(
                        children: [
                          Expanded(
                            child: ClipRRect(
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
                          ),
                          const SizedBox(
                              width: 8), // Jarak antara TextField dan ikon
                          InkWell(
                            onTap: () {
                              // Aksi untuk scan QR Code
                              print('Scan QR Code di sini');
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xff5755fe),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.all(12),
                              child: Icon(
                                Icons.qr_code_scanner_rounded,
                                size: 24,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 34,
                      ),

                      Text(
                        'Stok Produk',
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
                        'Satuan Produk',
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
                        'Harga Beli',
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
                          controller: _hargaBeliController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                              prefixText: 'Rp. ',
                              prefixStyle: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Color(0xffd9d9d9)),
                              filled: true,
                              fillColor: Colors.white,
                              border: InputBorder.none),
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
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: TextField(
                          controller: _hargaJualController,
                          enabled: false,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(12),
                              prefixText: 'Rp. ',
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(255, 255, 255, 255),
                              border: InputBorder.none),
                        ),
                      ),
                      SizedBox(height: 38),
                      SizedBox(
                        height: 38,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // BUTTON SAVE
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 120,
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
                    // Implementasi logika penyimpanan
                    String address = _addressController.text;
                    print('Alamat Toko: $address');
                    print('Path Foto Toko: $_storeImagePath');
                    print('Profit Setting: $_selectedProfitOption');
                  },
                  child: Text(
                    'Simpan',
                    style: TextStyle(
                        color: const Color.fromARGB(255, 255, 255, 255)),
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
