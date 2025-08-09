import 'package:intl/intl.dart';

class HelperFunctions {
  static String FormatDate(unixTimestamp){
  var date = DateTime.fromMillisecondsSinceEpoch(unixTimestamp * 1000);
  return DateFormat('d. MMMM').format(date);
}

static String FormatTime(unixTimestamp){
  var hour = DateTime.fromMillisecondsSinceEpoch(unixTimestamp * 1000);
  return DateFormat('Hm').format(hour);
}

static String FormatDay(unixTimestamp){
  var day = DateTime.fromMillisecondsSinceEpoch(unixTimestamp * 1000);
  return DateFormat('EEEE').format(day);
}

static String FormatAstroTime(String time){
  DateTime now = DateTime.now();
  DateTime parsedTime = DateFormat('hh:mm a').parse(time);
  return DateFormat('HH:mm').format(parsedTime);
}

static int getStartTime(int num){
  DateTime now = DateTime.now();
  int time = int.parse(DateFormat('H').format(now));
  int adjustedTime = (time + num)>23 ? (time+num)-24 : time+num;
  return adjustedTime;
}

static String conditionCodeToIcon(int? code) {
  switch (code) {
    case 1000:
      return "sunny.png"; // Sunny, Clear
    case 1003:
      return "cloudy.png"; // Partly cloudy
    case 1006:
      return "cloudy.png"; // Cloudy
    case 1009:
      return "cloudy.png"; // Overcast
    case 1030:
      return "cloudy-with-sun.png"; // Mist
    case 1063:
      return "rain.png"; // Patchy rain possible
    case 1066:
      return "snowy.png"; // Patchy snow possible
    case 1069:
      return "snow.png"; // Patchy sleet possible
    case 1072:
      return "snow.png"; // Patchy freezing drizzle possible
    case 1087:
      return "storm.png"; // Thundery outbreaks possible
    case 1114:
      return "rainy-day-with-sun.png"; // Blowing snow
    case 1117:
      return "rainy-day-with-sun.png"; // Blizzard
    case 1135:
      return "foggy.png"; // Fog
    case 1147:
      return "foggy.png"; // Freezing fog
    case 1150:
      return "rain.png"; // Patchy light drizzle
    case 1153:
      return "rain.png"; // Light drizzle
    case 1168:
      return "rain.png"; // Freezing drizzle
    case 1171:
      return "rain.png"; // Heavy freezing drizzle
    case 1180:
      return "rain.png"; // Patchy light rain
    case 1183:
      return "rain.png"; // Light rain
    case 1186:
      return "rain.png"; // Moderate rain at times
    case 1189:
      return "rain.png"; // Moderate rain
    case 1192:
      return "rain.png"; // Heavy rain at times
    case 1195:
      return "rain.png"; // Heavy rain
    case 1198:
      return "rain.png"; // Light freezing rain
    case 1201:
      return "rain.png"; // Moderate or heavy freezing rain
    case 1204:
      return "rain.png"; // Light sleet
    case 1207:
      return "rain.png"; // Moderate or heavy sleet
    case 1210:
      return "snowy.png"; // Patchy light snow
    case 1213:
      return "snowy.png"; // Light snow
    case 1216:
      return "snowy.png"; // Patchy moderate snow
    case 1219:
      return "snowy.png"; // Moderate snow
    case 1222:
      return "snowy.png"; // Patchy heavy snow
    case 1225:
      return "snowy.png"; // Heavy snow
    case 1237:
      return "snowy.png"; // Ice pellets
    case 1240:
      return "rain.png"; // Light rain shower
    case 1243:
      return "rain.png"; // Moderate or heavy rain shower
    case 1246:
      return "rain.png"; // Torrential rain shower
    case 1249:
      return "snowy.png"; // Light sleet showers
    case 1252:
      return "snowy.png"; // Moderate or heavy sleet showers
    case 1255:
      return "snowy.png"; // Light snow showers
    case 1258:
      return "snowy.png"; // Moderate or heavy snow showers
    case 1261:
      return "rain.png"; // Light showers of ice pellets
    case 1264:
      return "rain.png"; // Moderate or heavy showers of ice pellets
    case 1273:
      return "storm.png"; // Patchy light rain with thunder
    case 1276:
      return "storm.png"; // Moderate or heavy rain with thunder
    case 1279:
      return "storm.png"; // Patchy light snow with thunder
    case 1282:
      return "storm.png"; // Moderate or heavy snow with thunder
    default:
      return "sunny.png"; // Default-Icon für unbekannte Codes
    } 
  }
}