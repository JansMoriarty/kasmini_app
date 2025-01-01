import 'package:flutter/material.dart';
import 'package:kasmini_app/page/login.dart';
import 'package:lottie/lottie.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage>
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
            decoration: const BoxDecoration(color: Color(0xFF5755FE)),
            child: Padding(
              padding: const EdgeInsets.all(34),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Lottie Animation dengan efek bounce
                  SlideTransition(
                    position: _slideAnimation,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: LottieBuilder.asset(
                        '../assets/lottie/start.json',
                        width: 350,
                        height: 345,
                      ),
                    ),
                  ),

                  // Container responsif dengan efek bounce
                  SlideTransition(
                    position: _slideAnimation,
                    child: FadeTransition(
                      opacity: _fadeAnimation,
                      child: Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(top: 35),
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: const Color(0xFF6462FF),
                          borderRadius: BorderRadius.circular(38),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Container(
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
                                    height: 6,
                                    width: 50,
                                  ),
                                ),
                                const SizedBox(height: 26),
                                const Text(
                                  'Transaksi jauh lebih mudah dan efisien',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  'Bawa bisnis Anda ke tingkat berikutnya dengan Kasir Mini! menghadirkan fitur yang dirancang untuk memenuhi kebutuhan usaha Anda.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Color.fromARGB(137, 255, 255, 255),
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 40),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LoginPage(),
                                    ),
                                  );
                                },
                                child: Container(
                                  color: Colors.white,
                                  width: double.infinity,
                                  height: 55,
                                  child: const Center(
                                    child: Text(
                                      'Mulai',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff5755fe),
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
