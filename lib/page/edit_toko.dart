import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class StoreSettingsPage extends StatefulWidget {
  @override
  _StoreSettingsPageState createState() => _StoreSettingsPageState();
}

class _StoreSettingsPageState extends State<StoreSettingsPage> {
  String? _storeImagePath;
  final TextEditingController _addressController = TextEditingController();
  String? _selectedProfitOption;

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
                          'Pengaturan Toko',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Poppins',
                            color: const Color.fromARGB(185, 0, 0, 0)
                          ),
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
                          : AssetImage('../assets/images/pfp.jpeg')
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
                      Row(
                        children: [
                          Icon(
                            Icons.store,
                            color: const Color.fromARGB(126, 0, 0, 0),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            'Nama Toko',
                            style: TextStyle(
                                fontSize: 14,
                                color: const Color.fromARGB(126, 0, 0, 0),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      // NAMA TOKO
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: TextField(
                          controller: _addressController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: InputBorder.none,
                          ),
                          maxLines: 1,
                        ),
                      ),
                      SizedBox(
                        height: 28,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_rounded,
                            color: const Color.fromARGB(126, 0, 0, 0),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            'Alamat Toko',
                            style: TextStyle(
                                fontSize: 14,
                                color: const Color.fromARGB(126, 0, 0, 0),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      // ALAMAT TOKO
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: TextField(
                          controller: _addressController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: InputBorder.none,
                          ),
                          maxLines: 3,
                        ),
                      ),
                      SizedBox(
                        height: 38,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.attach_money_rounded,
                            color: const Color.fromARGB(126, 0, 0, 0),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            'Profit Settings',
                            style: TextStyle(
                                fontSize: 14,
                                color: const Color.fromARGB(126, 0, 0, 0),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      // Profit Dropdown
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 4.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                        ),
                        child: DropdownButton<String>(
                          value: _selectedProfitOption,
                          hint: Text(
                            'Pilih Profit',
                            style: TextStyle(fontFamily: 'Poppins'),
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedProfitOption = newValue;
                            });
                          },
                          isExpanded: true,
                          items: [
                            DropdownMenuItem<String>(
                              value: 'A',
                              child: Text(
                                'Profit = Omzet - Modal',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: const Color.fromARGB(122, 0, 0, 0),
                                    fontSize: 13),
                              ),
                            ),
                            DropdownMenuItem<String>(
                              value: 'B',
                              child: Text(
                                  'Profit = Omzet - Modal - Pengeluaran',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: const Color.fromARGB(122, 0, 0, 0),
                                      fontSize: 13)),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.print_rounded,
                            color: const Color.fromARGB(126, 0, 0, 0),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Pengaturan Printer',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                color: const Color.fromARGB(126, 0, 0, 0),
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        width: double.maxFinite,
                        child: Divider(
                          color: const Color.fromARGB(49, 0, 0, 0),
                          thickness: 1,
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        width: double.infinity,
                        height: 60,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Pilih Printer',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: const Color.fromARGB(126, 0, 0, 0)),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: const Color.fromARGB(126, 0, 0, 0),
                                size: 12,
                              )
                            ],
                          ),
                        ),
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
