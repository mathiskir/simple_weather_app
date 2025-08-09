import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_weather_app/data/objects/api_forecast_response.dart';
import 'package:simple_weather_app/data/weather_api.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_weather_app/env/env.dart';
import 'package:simple_weather_app/helper/helper_functions.dart';
import 'package:simple_weather_app/views/widgets/daily_weather_widget.dart';
import 'package:simple_weather_app/views/widgets/error_widget.dart';
import 'package:simple_weather_app/views/widgets/footer_widget.dart';
import 'package:simple_weather_app/views/widgets/hourly_weather_widget.dart';
import 'package:simple_weather_app/views/widgets/loading_widget.dart';
import 'package:simple_weather_app/views/widgets/location_selector_widget.dart';
import 'package:simple_weather_app/views/widgets/sunpath_widget.dart';
import 'package:simple_weather_app/views/widgets/top_app_bar_widget.dart';
import 'package:simple_weather_app/views/widgets/uv_index_graph_widget.dart';
import 'package:simple_weather_app/views/widgets/weather_metrics_bar_widget.dart';
import 'package:simple_weather_app/views/widgets/weather_summary_widget.dart';

class Weather extends StatefulWidget {
  const Weather({super.key});

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  late Future<ApiForecastResponse> weatherData;
  late String currentCity;
  late String apikey = Env.weatherApiKey;
  late SharedPreferences prefs;
  late String selectedFont = "AR One Sans";
  late Future googleFontsFuture;
  bool _isInitalized = false;
  final GlobalKey<FormState> _locationFormKey = GlobalKey<FormState>();
  final TextEditingController _locationFormController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if(!_isInitalized){
      weatherData = assignWeatherDataCurrentCity();
      googleFontsFuture = GoogleFonts.pendingFonts([GoogleFonts.arOneSans()]);
      _isInitalized = true;
    }
    super.didChangeDependencies();
  }

  Future<String> getSavedCity () async {
    prefs = await SharedPreferences.getInstance();
    return prefs.getString('currentCity') ?? 'Berlin';
  }

  Future setSavedCity (city) async{
    prefs = await SharedPreferences.getInstance();
    return prefs.setString('currentCity', city);
  }

  Future<ApiForecastResponse> assignWeatherDataCurrentCity() async {
    currentCity = await getSavedCity();
    return Provider.of<WeatherApi>(context, listen: false).fetchForecast(currentCity, apikey);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: int.parse(DateFormat('H').format(DateTime.now())) >= 22 ? Color.fromARGB(255, 3, 83, 244): Color.fromARGB(255, 3, 160, 244),
      extendBodyBehindAppBar: true,
      body: FutureBuilder(
        future: Future.wait([weatherData, googleFontsFuture]),
        builder: (contexts, snapshot) {
          if (snapshot.connectionState == ConnectionState.done && snapshot.hasData
          ) {
            return RefreshIndicator(
            onRefresh: () async {
              setState((){
                weatherData = Provider.of<WeatherApi>(context, listen: false).fetchForecast(currentCity, apikey);
              });
            },
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: snapshot.data![0].current.is_day!=0 ? [Color.fromARGB(255, 3, 180, 244), Color.fromARGB(255, 3, 140, 244)] : [Color.fromARGB(255, 3, 83, 244), Color.fromARGB(255, 3, 31, 244)],
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    topAppBar(
                      context: context, 
                      locationFormKey: _locationFormKey, 
                      locationFormController: _locationFormController, 
                      snapshot: snapshot,
                      onConfirmationPress: (city) {
                        setState(() {
                          currentCity = _locationFormController.text;
                          weatherData = Provider.of<WeatherApi>(context, listen: false).fetchForecast(currentCity, apikey);
                        });
                      },
                    ),
                    weatherSummary(snapshot: snapshot),
                    weatherMetricsBar(snapshot: snapshot),
                    hourlyWeather(snapshot: snapshot, context: context),
                    dailyWeather(snapshot: snapshot),
                    sunpath(snapshot: snapshot),
                    uvIndexGraph(snapshot: snapshot, context: context),
                    footer(),
                  ],
                ),
              ),
            ),
                          );
          } else if(snapshot.hasError){
            return error(snapshot: snapshot, context: context);
          }
        return loading();
        },
      ),
    );
  }
}
