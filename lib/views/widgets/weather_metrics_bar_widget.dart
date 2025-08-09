import 'package:flutter/material.dart';   
import 'package:google_fonts/google_fonts.dart';

Widget weatherMetricsBar({
  required AsyncSnapshot<List<dynamic>> snapshot,
}){
  return Container(
    padding: EdgeInsets.all(12),
    margin: EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      color: snapshot.data![0].current.is_day!=0 ? Color.fromARGB(192, 141, 196, 255): Color.fromARGB(192, 36, 34, 134),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              Icons.water_drop,
              size: 17,
              color: Colors.white,
            ),
            Text(
              "${snapshot.data![0].forecast.forecastday[0].day.daily_chance_of_rain}%",
              style: GoogleFonts.arOneSans(
                fontSize: 13,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        Row(
          children: [
            Icon(
              Icons.thermostat,
              size: 17,
              color: Colors.white,
            ),
            Text(
              "${snapshot.data![0].forecast.forecastday[0].day.avghumidity}%",
              style: GoogleFonts.arOneSans(
                fontSize: 13,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        Row(
          children: [
            Icon(
              Icons.air,
              size: 17,
              color: Colors.white,
            ),
            Text(
              "${snapshot.data![0].forecast.forecastday[0].day.maxwind_kph.round()}km/h",
              style: GoogleFonts.arOneSans(
                fontSize: 13,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        )
      ],
    ),
  );
}