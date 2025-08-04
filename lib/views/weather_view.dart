import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Weather extends StatefulWidget {
  const Weather({super.key});

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color.fromARGB(255, 3, 180, 244), Color.fromARGB(255, 3, 140, 244)],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(top: 50, left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            icon: Icon(
                              Icons.location_pin,
                              color: Colors.white,
                              size: 30,
                            ),
                            onPressed:() {},
                          ),
                        SizedBox(width: 10),
                        Text(
                          "Oldenburg",
                          style: GoogleFonts.lexendExa(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: Icon(Icons.refresh, color: Colors.white, size: 35),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              Image.asset(
                'assets/images/cloudy-with-sun.png', 
                scale: 2.3
              ),
              Text(
                "28°",
                style: GoogleFonts.lexendExa(
                  fontSize: 80,
                  color: Colors.white,
                )
              ),
              Text(
                "Teils Sonnig, teils Bewölkt\nMax.: 32° Min.: 20°", 
                textAlign: TextAlign.center,
                style: GoogleFonts.arOneSans(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w500
                )
              ),
              Container(
                padding: EdgeInsets.all(12),
                margin: EdgeInsets.only(top: 20, bottom: 20, left: 30, right: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Color.fromARGB(192, 141, 196, 255)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Icon(
                            Icons.water_drop,
                            color: Colors.white,  
                          ),
                          Text(
                            "98%",
                            style: GoogleFonts.arOneSans(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                            )
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Icon(
                            Icons.thermostat,
                            color: Colors.white,  
                          ),
                          Text(
                            "22%",
                            style: GoogleFonts.arOneSans(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                            )
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Icon(
                            Icons.air,
                            color: Colors.white,  
                          ),
                          Text(
                            "20km/h",
                            style: GoogleFonts.arOneSans(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                            )
                          )
                        ],
                      ),
                    )
                  ],
                )
              ),
              Container(
                margin: EdgeInsets.only(top: 0, bottom: 10, left: 30, right: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Color.fromARGB(192, 141, 196, 255)
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
                              fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            "04 August",
                            style: GoogleFonts.lexendExa(
                              fontSize: 17,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(width: 12),
                          HourlyWeatherItem("20°", "rain.png", "14:00"),
                          HourlyWeatherItem("19°", "storm.png", "15:00"),
                          HourlyWeatherItem("17°", "storm.png", "16:00"),
                          HourlyWeatherItem("18°", "rain.png", "16:00"),
                          SizedBox(width: 12),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(12),
                  margin: EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Color.fromARGB(192, 141, 196, 255)
                  ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Wochenübersicht",
                          style: GoogleFonts.lexendExa(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        Icon(
                          Icons.calendar_month,
                          color: Colors.white,
                          size: 30
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Column(
                      children: [
                        DailyWeatherItem("Heute", "rain.png", "32°", "20°"),
                        DailyWeatherItem("Mittwoch", "sunny.png", "29°", "22°"),
                        DailyWeatherItem("Donnerstag", "cloudy-with-sun.png", "26°", "19°")
                      ],
                    )
                  ],
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget HourlyWeatherItem(String temp, String icon, String hour){
  return Container(
    margin: EdgeInsets.all(10),
    child: Column(
      children: [
        Text(
          "$temp",
          style: GoogleFonts.lexendExa(
            fontSize: 17,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 20,),
        Image.asset(
          'assets/images/$icon', 
          scale: 9
        ),
        SizedBox(height: 20,),
        Text(
          "$hour",
          style: GoogleFonts.lexendExa(
            fontSize: 17,
            color: Colors.white,
          ),
    
        )
      ],
    ),
  );
}

Widget DailyWeatherItem(String day, String icon, String maxTemp, String minTemp){
  return Container(
    margin: EdgeInsets.only(left: 10, right: 10, bottom: 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 110,
          child: Text(
            "$day",
            style: GoogleFonts.lexendExa(
              fontSize: 15,
              color: Colors.white,
            ),
          ),
        ),
        Image.asset(
          'assets/images/$icon', 
          scale: 15
        ),
        SizedBox(
          width: 70,
          child: Row(
            children: [
              Text(
                minTemp,
                style: GoogleFonts.lexendExa(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 5),
              Text(
                minTemp,
                style: GoogleFonts.lexendExa(
                  fontSize: 15,
                  color: Colors.white,
                ),
              )
            ],
          )
        )
      ],
    )
  );
}