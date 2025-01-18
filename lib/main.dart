import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kasmini_app/control/addprod_ctrl.dart';
import 'package:kasmini_app/design/card_account.dart';
import 'package:kasmini_app/design/card_add_stok.dart';
import 'package:kasmini_app/design/card_history.dart';
import 'package:kasmini_app/design/card_product.dart';
import 'package:kasmini_app/design/card_stok.dart';
import 'package:kasmini_app/design/ex_prodwidget.dart';
import 'package:kasmini_app/design/nav.dart';
import 'package:kasmini_app/page/account/akun_kasir.dart';
import 'package:kasmini_app/page/account/edit_akun.dart';
import 'package:kasmini_app/page/add_stok.dart';
import 'package:kasmini_app/page/edit_toko.dart';
import 'package:kasmini_app/page/example_prod.dart';
import 'package:kasmini_app/page/history/belum_bayar.dart';
import 'package:kasmini_app/page/history/belum_lunas.dart';
import 'package:kasmini_app/page/history/detail_history.dart';
import 'package:kasmini_app/page/history/dibatalkan.dart';
import 'package:kasmini_app/page/history/history.dart';
import 'package:kasmini_app/page/home.dart';
import 'package:kasmini_app/page/kategori.dart';
import 'package:kasmini_app/page/login.dart';
import 'package:kasmini_app/page/main_page.dart';
import 'package:kasmini_app/page/manage_stok.dart';
import 'package:kasmini_app/page/pengeluaran/data_pengeluaran.dart';
import 'package:kasmini_app/page/pengeluaran/pengeluaran.dart';
import 'package:kasmini_app/page/pilih_prod.dart';
import 'package:kasmini_app/page/print_resi.dart';
import 'package:kasmini_app/page/start.dart';
import 'package:kasmini_app/page/success.dart';



void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}
