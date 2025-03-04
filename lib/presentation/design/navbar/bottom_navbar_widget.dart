import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:kasmini_app/presentation/app_theme.dart';
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
        color: AppTheme.bottomNavigationBarThemeData.backgroundColor,
        boxShadow: [AppTheme.boxShadow],
      ),
      child: BlocBuilder<NavbarCubit, int>(
        builder: (context, currIndex) => GNav(
          backgroundColor:
              AppTheme.bottomNavigationBarThemeData.backgroundColor!,
          color: AppTheme.primaryColor,
          activeColor: AppTheme.primaryColor,
          tabBackgroundColor:
              AppTheme.bottomNavigationBarThemeData.selectedItemColor!,
          padding: const EdgeInsets.all(10),
          gap: 12,
          selectedIndex: currIndex,
          onTabChange: (index) => navbarCubit.changeIndex(index),
          tabs: navItems
              .map((item) => GButton(
                    icon: item.icon,
                    iconSize: 30,
                    text: item.label,
                    textStyle: AppTheme.textTheme.bodyMedium?.copyWith(
                      color: AppTheme.primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
