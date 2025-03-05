import 'package:flutter/material.dart';

class CardProductWidget extends StatelessWidget {
  const CardProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Column(
          children: [
            Image.asset(
              'assets/images/gitar.png',
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
