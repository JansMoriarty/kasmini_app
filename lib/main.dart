import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kasmini_app/design/card_add_stok.dart';
import 'package:kasmini_app/design/card_product.dart';
import 'package:kasmini_app/design/card_stok.dart';
import 'package:kasmini_app/design/ex_prodwidget.dart';
import 'package:kasmini_app/design/nav.dart';
import 'package:kasmini_app/page/add_stok.dart';
import 'package:kasmini_app/page/edit_toko.dart';
import 'package:kasmini_app/page/example_prod.dart';
import 'package:kasmini_app/page/home.dart';
import 'package:kasmini_app/page/kategori.dart';
import 'package:kasmini_app/page/login.dart';
import 'package:kasmini_app/page/manage_stok.dart';
import 'package:kasmini_app/page/pilih_prod.dart';
import 'package:kasmini_app/page/start.dart';



void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
