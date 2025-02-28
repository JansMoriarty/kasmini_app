  import 'package:flutter/material.dart';
  import 'package:flutter_bloc/flutter_bloc.dart';
  import 'package:kasmini_app/domain/entities/kasir.dart';
  import 'package:kasmini_app/presentation/bloc/kasir/current_kasir/current_kasir_cubit.dart';

  class WelcomeCardWidget extends StatelessWidget {
    const WelcomeCardWidget({super.key});

    @override
    Widget build(BuildContext context) {
      return BlocBuilder<CurrentKasirCubit, Kasir?>(
        builder: (context, currKasir) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Selamat Datang!",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 4),
                Text(
                  currKasir?.nama ?? 'User',
                  style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF5755FE),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins'),
                ),
              ],
            ),
            const CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage('assets/images/avatar.jpg'),
            ),
          ],
        ),
      );
    }
  }
