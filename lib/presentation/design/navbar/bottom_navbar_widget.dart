import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:kasmini_app/presentation/bloc/navbar_cubit.dart';

class NavItem {
  final IconData icon;
  final String label;

  NavItem({required this.icon, required this.label});
}

List<NavItem> navItems = [
  NavItem(icon: Icons.home, label: 'Home'),
  NavItem(icon: Icons.analytics, label: 'Laporan'),
  NavItem(icon: Icons.shopping_bag, label: 'Beli'),
  NavItem(icon: Icons.person, label: 'Profil'),
];

class BottomNavbarWidget extends StatelessWidget {
  const BottomNavbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final NavbarCubit navbarCubit = context.read<NavbarCubit>();

    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white, // Warna background kartu
        borderRadius: BorderRadius.circular(12), // Sudut membulat
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(23, 0, 0, 0),
            blurRadius: 6,
            offset: const Offset(0, -1.5),
          ),
        ],
      ),
      child: BlocBuilder<NavbarCubit, int>(
        builder: (context, currIndex) => GNav(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          color: const Color(0xff5755fe),
          activeColor: const Color(0xff5755fe),
          tabBackgroundColor: const Color.fromARGB(39, 217, 217, 217),
          padding: const EdgeInsets.all(10),
          gap: 12,
          selectedIndex: currIndex,
          onTabChange: (index) => navbarCubit.changeIndex(index),
          tabs: navItems.map((item) => navbarItem(item)).toList(),
        ),
      ),
    );
  }

  GButton navbarItem(NavItem item) {
    return GButton(
      icon: item.icon,
      iconSize: 30,
      text: item.label,
      textStyle: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 14,
        color: Color(0xff5755fe),
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
