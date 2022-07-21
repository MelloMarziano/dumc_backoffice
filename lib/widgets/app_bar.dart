import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarWidget extends StatelessWidget {
  final String title;

  const AppBarWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: 60,
      width: double.infinity,
      decoration: const BoxDecoration(
          //color: Colors.black,
          ),
      child: Text(
        title,
        style: GoogleFonts.poppins(
          textStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
      ),
    );
  }
}
