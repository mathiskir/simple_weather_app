import 'package:flutter/material.dart';   
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_weather_app/views/widgets/daily_weather_item_widget.dart';
import 'package:simple_weather_app/helper/helper_functions.dart';

Widget dailyWeather({
  required AsyncSnapshot<List<dynamic>> snapshot,
}){
  return Container(
    padding: EdgeInsets.all(12),
    margin: EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30),
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
              "Wochenübersicht",
              style: GoogleFonts.lexendExa(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(Icons.calendar_month, color: Colors.white, size: 20),
          ],
        ),
        SizedBox(height: 10),
        Column(
          children: [
            DailyWeatherItem("${HelperFunctions.FormatDay(snapshot.data![0].forecast.forecastday[0].date_epoch)}", "${HelperFunctions.conditionCodeToIcon(snapshot.data![0].forecast.forecastday[0].day.condition.code)}", "${(snapshot.data![0].forecast.forecastday[0].day.maxtemp_c.round())}°", "${snapshot.data![0].forecast.forecastday[0].day.mintemp_c.round()}°"),
            DailyWeatherItem("${HelperFunctions.FormatDay(snapshot.data![0].forecast.forecastday[1].date_epoch)}", "${HelperFunctions.conditionCodeToIcon(snapshot.data![0].forecast.forecastday[1].day.condition.code)}", "${(snapshot.data![0].forecast.forecastday[1].day.maxtemp_c.round())}°", "${snapshot.data![0].forecast.forecastday[1].day.mintemp_c.round()}°"),
            DailyWeatherItem("${HelperFunctions.FormatDay(snapshot.data![0].forecast.forecastday[2].date_epoch)}", "${HelperFunctions.conditionCodeToIcon(snapshot.data![0].forecast.forecastday[2].day.condition.code)}", "${(snapshot.data![0].forecast.forecastday[2].day.maxtemp_c.round())}°", "${snapshot.data![0].forecast.forecastday[2].day.mintemp_c.round()}°")
          ],
        )
      ],
    ),
  );
}