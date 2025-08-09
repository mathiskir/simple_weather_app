import 'package:flutter/material.dart';   
import 'package:google_fonts/google_fonts.dart';

Widget DailyWeatherItem(String day, String icon, String maxTemp, String minTemp) {
  return Container(
    margin: EdgeInsets.only(left: 10, right: 10, bottom: 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 100,
          child: SelectableText(
            "$day",
            style: GoogleFonts.lexendExa(
              fontSize: 13,
              color: Colors.white,
            ),
          ),
        ),
        Image.asset('assets/images/$icon', scale: 16),
        SizedBox(
          width: 55,
          child: Row(
            children: [
              Text(
                maxTemp,
                style: GoogleFonts.lexendExa(
                  fontSize: 13,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 5),
              Text(
                minTemp,
                style: GoogleFonts.lexendExa(
                  fontSize: 13,
                  color: Colors.white,
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}
