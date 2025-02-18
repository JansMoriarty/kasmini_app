import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasmini_app/presentation/bloc/navbar_cubit.dart';
import 'package:kasmini_app/presentation/design/navbar/bottom_navbar_widget.dart';
import 'package:kasmini_app/presentation/views/home.dart';
import 'package:kasmini_app/presentation/views/manage_stok.dart';
import 'package:kasmini_app/presentation/views/report/main_report.dart';
import 'package:kasmini_app/presentation/views/transaksi/main_transaksi.dart';

const List<Widget> pages = [
  HomePage(),
  MainReport(),
  MainTransaksi(),
  ManageStok(),
];

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: BlocBuilder<NavbarCubit, int>(
            builder: (context, currIndex) => pages.elementAt(currIndex)),
        bottomNavigationBar: BottomNavbarWidget());
  }
}
