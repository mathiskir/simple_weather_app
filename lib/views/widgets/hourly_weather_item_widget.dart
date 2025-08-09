import 'package:flutter/material.dart';   
import 'package:google_fonts/google_fonts.dart';

Widget HourlyWeatherItem(String temp, String icon, String hour) {
  return Container(
    margin: EdgeInsets.all(10),
    child: Column(
      children: [
        Text(
          "$temp",
          style: GoogleFonts.lexendExa(
            fontSize: 13,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 10),
        Image.asset('assets/images/$icon', scale: 11),
        SizedBox(height: 10),
        Text(
          "$hour",
          style: GoogleFonts.lexendExa(
            fontSize: 13,
            color: Colors.white,
          ),
        )
      ],
    ),
  );
}
