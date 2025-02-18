import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NavDesign extends StatefulWidget {
  const NavDesign({super.key});

  @override
  State<NavDesign> createState() => _NavDesignState();
}

class _NavDesignState extends State<NavDesign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavWidget(),
    );
  }
}

class NavWidget extends StatelessWidget {
  const NavWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 255, 255, 255),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Container(
          child: GNav(
              backgroundColor: Color.fromARGB(255, 255, 255, 255),
              color: Color(0xff5755fe),
              activeColor: Color(0xff5755fe),
              tabBackgroundColor: Color.fromARGB(69, 217, 217, 217),
              padding: EdgeInsets.all(16),
              gap: 12,
              tabs: [
                GButton(
                  icon: Icons.home,
                  iconSize: 30,
                  text: 'Home',
                  textStyle: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      color: Color(0xff5755fe), fontWeight: FontWeight.w600),
                ),
                GButton(
                  icon: Icons.analytics,
                  iconSize: 30,
                  text: 'Laporan',
                  textStyle: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      color: Color(0xff5755fe), fontWeight: FontWeight.w600),
                ),
                GButton(
                  icon: Icons.shopping_cart_outlined,
                  iconSize: 30,
                  text: 'Transaksi',
                  textStyle: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      color: Color(0xff5755fe), fontWeight: FontWeight.w600),
                ),
                GButton(
                  icon: Icons.person,
                  iconSize: 30,
                  text: 'Profil',
                  textStyle: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      color: Color(0xff5755fe), fontWeight: FontWeight.w600),
                ),
              ]),
        ),
      ),
    );
  }
}
