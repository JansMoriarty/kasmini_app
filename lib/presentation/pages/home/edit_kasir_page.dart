import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:kasmini_app/presentation/bloc/kasir/kasir_bloc.dart';
import 'package:kasmini_app/presentation/views/account/edit_kasir_view.dart';

class EditKasirPage extends StatelessWidget {
  final int kasirId;

  const EditKasirPage({super.key, required this.kasirId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.instance.get<KasirBloc>(),
      child: EditKasirView(kasirId: kasirId),
    );
  }
}