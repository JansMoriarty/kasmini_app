import 'package:flutter/material.dart';
import 'package:kasmini_app/presentation/views/home.dart';
import 'package:kasmini_app/presentation/views/login.dart';
import 'package:kasmini_app/presentation/views/main_view.dart';
import 'package:lottie/lottie.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({super.key});

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<SuccessPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration:
          const Duration(milliseconds: 900), // Tambah durasi untuk efek bounce
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1), // Mulai dari bawah layar
      end: Offset.zero, // Berhenti di posisi normal
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut, // Efek smooth untuk masuk
      reverseCurve: Curves.bounceOut, // Efek bounce keluar
    ));

    _fadeAnimation = Tween<double>(
      begin: 0.0, // Transparan
      end: 1.0, // Opaque
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn, // Efek smooth fade-in
    ));

    _controller.forward(); // Mulai animasi
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final screenHeight = constraints.maxHeight;

          return Container(
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
            child: Padding(
              padding: const EdgeInsets.all(34),
              child: Column(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, // Menyusun elemen di antara atas dan bawah
                children: [
                  Column(
                    children: [
                      // Lottie Animation dengan efek bounce
                      SlideTransition(
                        position: _slideAnimation,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 100),
                          child: LottieBuilder.asset(
                            '../assets/lottie/check.json',
                            width: 250,
                            height: 250,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SlideTransition(
                        position: _slideAnimation,
                        child: FadeTransition(
                          opacity: _fadeAnimation,
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Container(
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  height: 6,
                                  width: 50,
                                ),
                              ),
                              const Text(
                                'Success!',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromARGB(184, 0, 0, 0),
                                  fontSize: 26,
                                ),
                              ),
                              const SizedBox(height: 18),
                              SizedBox(
                                width: 320,
                                child: const Text(
                                  'Berhasil! Perubahan yang kamu buat sudah disimpan dengan aman. Kamu bisa melanjutkan aktivitas tanpa khawatir.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Color.fromARGB(90, 0, 0, 0),
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Tombol di bawah layar
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MainView(),
                          ),
                        );
                      },
                      child: Container(
                        color: Color(0xff5755fe),
                        width: double.infinity,
                        height: 65,
                        child: const Center(
                          child: Text(
                            'Kembali ke Home',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 16,
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
        },
      ),
    );
  }
}
