import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:kasmini_app/presentation/bloc/produk/produk_bloc.dart';
import 'package:kasmini_app/presentation/views/product/list_produk_view.dart';

class ListProdukPage extends StatelessWidget {
  const ListProdukPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.instance.get<ProdukBloc>(),
      child: ListProdukView(),
    );
  }
}