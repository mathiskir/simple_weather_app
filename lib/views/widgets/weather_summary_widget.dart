import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_weather_app/helper/helper_functions.dart';

Widget weatherSummary({
  required AsyncSnapshot<List<dynamic>> snapshot,
}){
  return Column(
    children: [
      Image.asset('assets/images/${HelperFunctions.conditionCodeToIcon(snapshot.data![0].forecast.forecastday[0].day.condition.code)}', scale: 3.4),
      Text(
        "${snapshot.data![0].current.temp_c.round()}°",
        style: GoogleFonts.lexendExa(
          fontSize: 65,
          color: Colors.white,
        ),
      ),
      Text(
        "${snapshot.data![0].current.condition.text}\nMin.: ${snapshot.data![0].forecast.forecastday[0].day.mintemp_c.round()}° Max.: ${snapshot.data![0].forecast.forecastday[0].day.maxtemp_c.round()}°",
        textAlign: TextAlign.center,
        style: GoogleFonts.arOneSans(
          fontSize: 14,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    ],
  );
}