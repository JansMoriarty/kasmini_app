import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:kasmini_app/presentation/bloc/kasir/list_kasir/list_kasir_bloc.dart';
import 'package:kasmini_app/presentation/views/account/list_kasir_view.dart';

class ListKasirPage extends StatelessWidget {
  const ListKasirPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.instance.get<ListKasirBloc>(),
      child: ListKasirView(),
    );
  }
}