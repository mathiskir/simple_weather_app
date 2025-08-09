import 'package:flutter/material.dart';   
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_weather_app/views/widgets/hourly_weather_item_widget.dart';
import 'package:simple_weather_app/helper/helper_functions.dart';

Widget hourlyWeather({
    required AsyncSnapshot<List<dynamic>> snapshot,
    required BuildContext context,
  }){
  return Container(
    margin: EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      color: snapshot.data![0].current.is_day!=0 ? Color.fromARGB(192, 141, 196, 255): Color.fromARGB(192, 36, 34, 134),
    ),
    child: Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 12, right: 12, top: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Heute",
                style: GoogleFonts.lexendExa(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "${HelperFunctions.FormatDate(snapshot.data![0].forecast.forecastday[0].date_epoch)}",
                style: GoogleFonts.lexendExa(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width-84,
            child: IntrinsicWidth(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HourlyWeatherItem("${snapshot.data![0].forecast.forecastday[0].hour[HelperFunctions.getStartTime(0)].temp_c.round()}°", "${HelperFunctions.conditionCodeToIcon(snapshot.data![0].forecast.forecastday[0].hour[HelperFunctions.getStartTime(0)].condition.code)}", "${HelperFunctions.FormatTime(snapshot.data![0].forecast.forecastday[0].hour[HelperFunctions.getStartTime(0)].time_epoch)}"),
                  HourlyWeatherItem("${snapshot.data![0].forecast.forecastday[0].hour[HelperFunctions.getStartTime(1)].temp_c.round()}°", "${HelperFunctions.conditionCodeToIcon(snapshot.data![0].forecast.forecastday[0].hour[HelperFunctions.getStartTime(1)].condition.code)}", "${HelperFunctions.FormatTime(snapshot.data![0].forecast.forecastday[0].hour[HelperFunctions.getStartTime(1)].time_epoch)}"),
                  HourlyWeatherItem("${snapshot.data![0].forecast.forecastday[0].hour[HelperFunctions.getStartTime(2)].temp_c.round()}°", "${HelperFunctions.conditionCodeToIcon(snapshot.data![0].forecast.forecastday[0].hour[HelperFunctions.getStartTime(2)].condition.code)}", "${HelperFunctions.FormatTime(snapshot.data![0].forecast.forecastday[0].hour[HelperFunctions.getStartTime(2)].time_epoch)}"),
                  HourlyWeatherItem("${snapshot.data![0].forecast.forecastday[0].hour[HelperFunctions.getStartTime(3)].temp_c.round()}°", "${HelperFunctions.conditionCodeToIcon(snapshot.data![0].forecast.forecastday[0].hour[HelperFunctions.getStartTime(3)].condition.code)}", "${HelperFunctions.FormatTime(snapshot.data![0].forecast.forecastday[0].hour[HelperFunctions.getStartTime(3)].time_epoch)}"),
                ],
              ),
            ),
          ),
        )
      ],
    ),
  );
}