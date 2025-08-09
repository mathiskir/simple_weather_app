import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget footer(){
  return Container(
    margin: EdgeInsets.only(top: 10, bottom: 10),
    child: Text(
      "SimpleWeatherApp\nDeveloped with ❤️ by Mathis Kirchner",
      textAlign: TextAlign.center,
      style: GoogleFonts.lexendExa(
        fontSize: 11,
        color: Colors.white,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}