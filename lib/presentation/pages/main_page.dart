import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:kasmini_app/presentation/bloc/navbar_cubit.dart';
import 'package:kasmini_app/presentation/views/main_view.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NavbarCubit>(
      create: (context) => GetIt.instance.get<NavbarCubit>(),
      child: const MainView(),
    );
  }
}