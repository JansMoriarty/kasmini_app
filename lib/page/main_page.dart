import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:kasmini_app/page/edit_toko.dart';
import 'package:kasmini_app/page/example_prod.dart';
import 'package:kasmini_app/page/history/history.dart';
import 'package:kasmini_app/page/home.dart';
import 'package:kasmini_app/page/manage_stok.dart';
import 'package:kasmini_app/page/pengeluaran/pengeluaran.dart';
import 'package:kasmini_app/page/print_resi.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  // Controller untuk PageView
  final PageController _pageController = PageController();

  final List<Widget> _pages = [
    const HomePage(),
    const History(),
    const ExampleProd(),
    const ManageStok(),
  ];

  // Fungsi untuk menangani tab yang dipilih
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Pindah ke halaman di PageView
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: _pages,
      ),
      bottomNavigationBar: Container(
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: GNav(
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            color: const Color(0xff5755fe),
            activeColor: const Color(0xff5755fe),
            tabBackgroundColor: const Color.fromARGB(69, 217, 217, 217),
            padding: const EdgeInsets.all(16),
            gap: 12,
            selectedIndex: _selectedIndex,
            onTabChange: _onItemTapped,
            tabs: const [
              GButton(
                icon: Icons.home,
                iconSize: 30,
                text: 'Home',
                textStyle: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  color: Color(0xff5755fe),
                  fontWeight: FontWeight.w600,
                ),
              ),
              GButton(
                icon: Icons.analytics,
                iconSize: 30,
                text: 'Laporan',
                textStyle: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  color: Color(0xff5755fe),
                  fontWeight: FontWeight.w600,
                ),
              ),
              GButton(
                icon: Icons.shopping_cart_outlined,
                iconSize: 30,
                text: 'Transaksi',
                textStyle: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  color: Color(0xff5755fe),
                  fontWeight: FontWeight.w600,
                ),
              ),
              GButton(
                icon: Icons.person,
                iconSize: 30,
                text: 'Profil',
                textStyle: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  color: Color(0xff5755fe),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Contoh halaman Home
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Halaman Home',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

// Contoh halaman History
class Haistory extends StatelessWidget {
  const Haistory({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Halaman History',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

// Contoh halaman ExampleProd
class ExampleProd extends StatelessWidget {
  const ExampleProd({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Halaman Produk',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

// Contoh halaman ManageStok
class ManageStok extends StatelessWidget {
  const ManageStok({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Halaman Kelola Stok',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
