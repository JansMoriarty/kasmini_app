import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:kasmini_app/domain/entities/kasir.dart';
import 'package:kasmini_app/presentation/app_theme.dart';
import 'package:kasmini_app/presentation/bloc/kasir/current_kasir/current_kasir_cubit.dart';
import 'package:kasmini_app/presentation/pages/home/list_kasir_page.dart';
import 'package:kasmini_app/presentation/pages/home/list_produk_page.dart';
import 'package:kasmini_app/presentation/views/edit_toko.dart';
import 'package:kasmini_app/presentation/views/product/list_produk_view.dart';
import 'package:kasmini_app/presentation/views/history/history.dart';
import 'package:kasmini_app/presentation/views/manage_stok.dart';
import 'package:kasmini_app/presentation/views/pengeluaran/pengeluaran.dart';
import 'package:kasmini_app/presentation/views/print_resi.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  MyHomeViewState createState() => MyHomeViewState();
}

class MyHomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + 20,
            bottom: 20,
            left: 20,
            right: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 25,
            children: [
              WelcomeCardWidget(),
              StoreCardWidget(),
              ServiceCarouselWidget(),
              ServiceListWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class WelcomeCardWidget extends StatelessWidget {
  const WelcomeCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentKasirCubit, Kasir?>(builder: (context, state) {
      final Kasir? kasir = state;

      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 4,
            children: [
              Text(
                "Selamat Datang!",
                style: AppTheme.textTheme.titleMedium?.copyWith(
                  color: AppTheme.secondaryTextColor,
                ),
              ),
              Text(
                kasir?.nama ?? 'User',
                style: AppTheme.textTheme.titleLarge?.copyWith(
                  color: AppTheme.primaryColor,
                ),
              ),
            ],
          ),
          CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(
                kasir?.foto ?? 'assets/images/avatar_placeholder.png'),
          ),
        ],
      );
    });
  }
}

class StoreCardWidget extends StatelessWidget {
  const StoreCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: AppTheme.primaryColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 6,
                  children: [
                    Text(
                      "Indomaret",
                      style: AppTheme.textTheme.titleSmall?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Jl. Pangeran Hidayatullah",
                      style: AppTheme.textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StoreSettingsPage(),
                        ),
                      );
                    },
                    child: Container(
                      width: 58,
                      height: 58,
                      color: const Color.fromARGB(255, 255, 255, 255),
                      child: Icon(
                        Icons.camera_alt_rounded,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: SizedBox(
                width: double.maxFinite,
                child: Divider(
                  color: const Color.fromARGB(166, 255, 255, 255),
                  thickness: 0.7,
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100)),
                      child: Icon(
                        Icons.shopping_cart_rounded,
                        color: Color(0xFF5755FE),
                        size: 13,
                      )),
                ),
                Text(
                  "Total Penjualan  : Rp. 0,",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontSize: 12.5),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100)),
                      child: Icon(
                        Icons.show_chart_rounded,
                        color: Color(0xFF5755FE),
                        size: 13,
                      )),
                ),
                Text(
                  "Total Profit           : Rp. 0,",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontSize: 12.5),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ServiceCarouselWidget extends StatelessWidget {
  const ServiceCarouselWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: [
        const Text(
          "Menu Layanan",
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Produk
              ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ListProdukPage(),
                      ),
                    );
                  },
                  child: Container(
                    height: 120,
                    width: 170,
                    color: Color.fromARGB(40, 115, 245, 143),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(bottom: 14),
                          child: Icon(
                            Icons.shopping_bag,
                            color: Color(0xff73F590),
                            size: 42,
                          ),
                        ),
                        Text(
                          'Produk',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff73F590)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              // Kelola Stok
              ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ManageStok()));
                  },
                  child: Container(
                    height: 120,
                    width: 170,
                    color: const Color.fromARGB(41, 235, 223, 55),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 16),
                          child: Icon(
                            Icons.dashboard_customize_rounded,
                            color: Color.fromARGB(255, 235, 223, 55),
                            size: 42,
                          ),
                        ),
                        const Text(
                          'Kelola Stok',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 235, 223, 55)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              // Cetak Resi
              ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PrintResiPage()));
                  },
                  child: Container(
                    height: 120,
                    width: 170,
                    color: const Color.fromARGB(40, 40, 213, 247),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 22),
                          child: Icon(
                            Icons.print_rounded,
                            color: Color.fromARGB(255, 40, 213, 247),
                            size: 42,
                          ),
                        ),
                        const Text(
                          'Cetak Resi',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 40, 213, 247)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => History()));
                  },
                  child: Container(
                    height: 120,
                    width: 170,
                    color: Color.fromARGB(40, 255, 149, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 22),
                          child: Icon(
                            Icons.history_rounded,
                            color: Color.fromARGB(255, 255, 149, 0),
                            size: 42,
                          ),
                        ),
                        const Text(
                          'Riwayat',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 255, 149, 0)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ServiceListWidget extends StatelessWidget {
  final CurrentKasirCubit _currentKasirCubit = GetIt.instance.get<CurrentKasirCubit>();

  ServiceListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Pengeluaran()));
          },
          child: Container(
            width: double.infinity,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: const Color.fromARGB(255, 255, 255, 255),
              boxShadow: [
                const BoxShadow(
                  color: Color.fromARGB(35, 0, 0, 0),
                  offset: Offset(0, 0),
                  blurRadius: 4,
                  spreadRadius: 0.5,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Container(
                          height: 45,
                          width: 45,
                          color: Color.fromARGB(59, 255, 120, 120),
                          child: Icon(
                            Icons.credit_card_rounded,
                            color: Color.fromARGB(255, 255, 120, 120),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 6),
                            child: Text(
                              'Pengeluaran',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11),
                            ),
                          ),
                          Text(
                            'Selalu Kelola Pengeluaranmu!',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                color: const Color.fromARGB(163, 0, 0, 0),
                                fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 18),
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: const Color.fromARGB(130, 61, 61, 61),
                    size: 11,
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 14,
        ),
        GestureDetector(
          onTap: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ListKasirPage(),
              ),
            );

            _currentKasirCubit.init();
          },
          child: Container(
            width: double.infinity,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: const Color.fromARGB(255, 255, 255, 255),
              boxShadow: [
                const BoxShadow(
                  color: Color.fromARGB(35, 0, 0, 0),
                  offset: Offset(0, 0),
                  blurRadius: 4,
                  spreadRadius: 0.5,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Container(
                          height: 45,
                          width: 45,
                          color: Color.fromARGB(55, 201, 128, 243),
                          child: Icon(
                            Icons.person_2_rounded,
                            color: Color(0xFFC980F3),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 6),
                            child: Text(
                              'Akun Kasir',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11),
                            ),
                          ),
                          Text(
                            'Kelola akun kasir ',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                color: const Color.fromARGB(163, 0, 0, 0),
                                fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 18),
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: const Color.fromARGB(130, 40, 40, 40),
                    size: 11,
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
