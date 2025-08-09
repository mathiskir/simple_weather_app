import 'package:flutter/material.dart';   
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_weather_app/helper/helper_functions.dart';

Widget sunpath({
  required AsyncSnapshot<List<dynamic>> snapshot
}){
  return Container(
    margin: EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30),
    padding: EdgeInsets.all(12),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      color: snapshot.data![0].current.is_day!=0 ? Color.fromARGB(192, 141, 196, 255): Color.fromARGB(192, 36, 34, 134),
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Sonnenlauf",
              style: GoogleFonts.lexendExa(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(
              Icons.sunny,
              color: Colors.white
            ),      
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Image.asset('assets/images/sunrise.png', scale: 8),
                SizedBox(height: 5),
                Text(
                  "${HelperFunctions.FormatAstroTime(snapshot.data![0].forecast.forecastday[0].astro.sunrise)}",
                  style: GoogleFonts.arOneSans(
                    fontSize: 13,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                )
              ],
            ),
            Column(
              children: [
                Image.asset('assets/images/sunset.png', scale: 8),
                SizedBox(height: 5),
                Text(
                  "${HelperFunctions.FormatAstroTime(snapshot.data![0].forecast.forecastday[0].astro.sunset)}",
                  style: GoogleFonts.arOneSans(
                    fontSize: 13,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                )
              ],
            )
          ],
          ),
      ],
    ),
  );
}