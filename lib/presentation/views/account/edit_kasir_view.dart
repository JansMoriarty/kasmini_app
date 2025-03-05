import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasmini_app/domain/entities/kasir.dart';
import 'package:kasmini_app/presentation/app_theme.dart';
import 'package:kasmini_app/presentation/bloc/kasir/detail_kasir/detail_kasir_bloc.dart';
import 'package:kasmini_app/presentation/bloc/kasir/detail_kasir/detail_kasir_event.dart';
import 'package:kasmini_app/presentation/bloc/kasir/detail_kasir/detail_kasir_state.dart';

class EditKasirView extends StatefulWidget {
  final int kasirId;

  const EditKasirView({super.key, required this.kasirId});

  @override
  EditKasirViewState createState() => EditKasirViewState();
}

class EditKasirViewState extends State<EditKasirView> {
  late final DetailKasirBloc _detailKasirBloc;

  final TextEditingController namaController = TextEditingController();
  final TextEditingController noHpController = TextEditingController();
  final TextEditingController pinController = TextEditingController();
  String? avatarImagePath;

  List<String> listImagePath = [
    'assets/images/male_owner.jpg',
    'assets/images/female_owner.jpg',
    'assets/images/avatar_male.jpg',
    'assets/images/avatar_female.jpg',
  ];

  void onSubmit() {
    _detailKasirBloc.add(UpdateKasir(
      id: widget.kasirId,
      nama: namaController.text,
      noHp: noHpController.text,
      pin: pinController.text,
      foto: avatarImagePath,
    ));
  }

  @override
  void initState() {
    super.initState();

    _detailKasirBloc = context.read<DetailKasirBloc>();
    _detailKasirBloc.add(LoadKasirById(widget.kasirId));
  }

  void _showImagePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: AppTheme.primaryColor,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Pilih Gambar',
                    style: AppTheme.textTheme.titleMedium?.copyWith(
                      color: Colors.white,
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
            Container(
              color: AppTheme.backgroundColor,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 12,
                children: listImagePath
                    .map((imagePath) => GestureDetector(
                          onTap: () {
                            _detailKasirBloc.add(ImageSelected(imagePath));
                            Navigator.pop(context);
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              imagePath,
                              width: 70,
                              height: 70,
                            ),
                          ),
                        ))
                    .toList(),
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
          child: Column(children: [
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
                child: BlocConsumer<DetailKasirBloc, DetailKasirState>(
                  listener: (context, state) {
                    if (state.status == DetailKasirStatus.updated) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: AppTheme.primaryColor,
                          content: Text('Data berhasil diubah'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state.status == DetailKasirStatus.loading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state.status == DetailKasirStatus.error) {
                      return Center(
                        child: Text(state.errorMessage ?? ''),
                      );
                    } else if (state.status == DetailKasirStatus.loaded ||
                        state.status == DetailKasirStatus.updating ||
                        state.status == DetailKasirStatus.updated) {
                      final Kasir? kasirData = state.kasirData;
                      final bool isUpdating =
                          state.status == DetailKasirStatus.updating;

                      if (kasirData == null) {
                        return Text('Tidak ada kasir');
                      }

                      namaController.text = kasirData.nama;
                      noHpController.text = kasirData.noHp ?? '';
                      pinController.text = kasirData.pin;
                      avatarImagePath = state.isImageUpdated
                          ? state.avatarImagePath
                          : kasirData.foto;

                      return Column(
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 32,
                                backgroundImage: AssetImage(avatarImagePath ??
                                    'assets/avatar/avatar_placeholder.png'),
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
                            child: TextField(
                              controller: namaController,
                              enabled: !isUpdating,
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
                              controller: noHpController,
                              enabled: !isUpdating,
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
                              controller: pinController,
                              enabled: !isUpdating,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              maxLength: 6,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(255, 233, 233, 233),
                                counterText: "",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Container();
                    }
                  },
                )),
          ]),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        padding: const EdgeInsets.all(20.0),
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            fixedSize: Size(double.infinity, 50),
            backgroundColor: AppTheme.primaryColor,
          ),
          onPressed: onSubmit,
          child: BlocBuilder<DetailKasirBloc, DetailKasirState>(
            builder: (context, state) {
              String textMessage = state.status == DetailKasirStatus.updating
                  ? 'Loading...'
                  : 'Simpan';

              return Text(
                textMessage,
                style: AppTheme.textTheme.bodyMedium
                    ?.copyWith(color: Colors.white),
              );
            },
          ),
        ),
      ),
    );
  }
}
