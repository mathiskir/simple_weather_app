import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget loading(){
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color.fromARGB(255, 3, 180, 244), Color.fromARGB(255, 3, 140, 244)],
      )
    ),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            color: Colors.white,
          ),
          SizedBox(height: 10,),
          Text(
            "Lade Wetterdaten...",
            style: GoogleFonts.arOneSans(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )
          )
        ],
      )
    ),
  );
}