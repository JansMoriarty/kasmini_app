import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:kasmini_app/presentation/bloc/kasir/kasir_bloc.dart';
import 'package:kasmini_app/presentation/views/account/kasir_view.dart';

class KasirPage extends StatelessWidget {
  const KasirPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.instance.get<KasirBloc>(),
      child: KasirView(),
    );
  }
}