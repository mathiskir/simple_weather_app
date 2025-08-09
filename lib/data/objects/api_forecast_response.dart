import 'dart:convert';

class ApiForecastResponse {
  final Location location;
  final Current current;
  final Forecast forecast;

  const ApiForecastResponse({
    required this.location,
    required this.current,
    required this.forecast,
  });

  factory ApiForecastResponse.fromJson(Map<String, dynamic> json) {
    return ApiForecastResponse(
      location: Location.fromJson(json['location']),
      current: Current.fromJson(json['current']),
      forecast: Forecast.fromJson(json['forecast']),
    );
  }
}

class Location {
  final String name;
  final String region;
  final String country;
  final double lat;
  final double lon;
  final String tz_id;
  final int localtime_epoch;
  final String localtime;

  const Location({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.tz_id,
    required this.localtime_epoch,
    required this.localtime,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      name: json['name'],
      region: json['region'],
      country: json['country'],
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
      tz_id: json['tz_id'],
      localtime_epoch: json['localtime_epoch'],
      localtime: json['localtime'],
    );
  }
}

class Current {
  final int last_updated_epoch;
  final String last_updated;
  final double temp_c;
  final double temp_f;
  final int is_day;
  final Condition condition;
  final double wind_mph;
  final double wind_kph;
  final int wind_degree;
  final String wind_dir;
  final double pressure_mb;
  final double pressure_in;
  final double precip_mm;
  final double precip_in;
  final int humidity;
  final int cloud;
  final double feelslike_c;
  final double feelslike_f;
  final double uv;
  final double gust_mph;
  final double gust_kph;

  const Current({
    required this.last_updated_epoch,
    required this.last_updated,
    required this.temp_c,
    required this.temp_f,
    required this.is_day,
    required this.condition,
    required this.wind_mph,
    required this.wind_kph,
    required this.wind_degree,
    required this.wind_dir,
    required this.pressure_mb,
    required this.pressure_in,
    required this.precip_mm,
    required this.precip_in,
    required this.humidity,
    required this.cloud,
    required this.feelslike_c,
    required this.feelslike_f,
    required this.uv,
    required this.gust_mph,
    required this.gust_kph,
  });

  factory Current.fromJson(Map<String, dynamic> json) {
    return Current(
      last_updated_epoch: json['last_updated_epoch'],
      last_updated: json['last_updated'],
      temp_c: (json['temp_c'] as num).toDouble(),
      temp_f: (json['temp_f'] as num).toDouble(),
      is_day: json['is_day'],
      condition: Condition.fromJson(json['condition']),
      wind_mph: (json['wind_mph'] as num).toDouble(),
      wind_kph: (json['wind_kph'] as num).toDouble(),
      wind_degree: json['wind_degree'],
      wind_dir: json['wind_dir'],
      pressure_mb: (json['pressure_mb'] as num).toDouble(),
      pressure_in: (json['pressure_in'] as num).toDouble(),
      precip_mm: (json['precip_mm'] as num).toDouble(),
      precip_in: (json['precip_in'] as num).toDouble(),
      humidity: json['humidity'],
      cloud: json['cloud'],
      feelslike_c: (json['feelslike_c'] as num).toDouble(),
      feelslike_f: (json['feelslike_f'] as num).toDouble(),
      uv: (json['uv'] as num).toDouble(),
      gust_mph: (json['gust_mph'] as num).toDouble(),
      gust_kph: (json['gust_kph'] as num).toDouble(),
    );
  }
}

class Condition {
  final String text;
  final String icon;
  final int code;

  const Condition({
    required this.text,
    required this.icon,
    required this.code,
  });

  factory Condition.fromJson(Map<String, dynamic> json) {
    return Condition(
      text: json['text'],
      icon: json['icon'],
      code: json['code'],
    );
  }
}

class Forecast {
  final List<Forecastday> forecastday;

  const Forecast({required this.forecastday});

  factory Forecast.fromJson(Map<String, dynamic> json) {
    return Forecast(
      forecastday: List<Forecastday>.from(
        json['forecastday'].map((x) => Forecastday.fromJson(x)),
      ),
    );
  }
}

class Forecastday {
  final String date;
  final int date_epoch;
  final Day day;
  final Astro astro;
  final List<Hour> hour;

  const Forecastday({
    required this.date,
    required this.date_epoch,
    required this.day,
    required this.astro,
    required this.hour,
  });

  factory Forecastday.fromJson(Map<String, dynamic> json) {
    return Forecastday(
      date: json['date'],
      date_epoch: json['date_epoch'],
      day: Day.fromJson(json['day']),
      astro: Astro.fromJson(json['astro']),
      hour: List<Hour>.from(
        json['hour'].map((x) => Hour.fromJson(x)),
      ),
    );
  }
}

class Day {
  final double maxtemp_c;
  final double maxtemp_f;
  final double mintemp_c;
  final double mintemp_f;
  final double avgtemp_c;
  final double avgtemp_f;
  final double maxwind_mph;
  final double maxwind_kph;
  final double totalprecip_mm;
  final double totalprecip_in;
  final double avgvis_km;
  final double avgvis_miles;
  final int avghumidity;
  final int daily_will_it_rain;
  final int daily_chance_of_rain;
  final int daily_will_it_snow;
  final int daily_chance_of_snow;
  final Condition condition;
  final double uv;

  const Day({
    required this.maxtemp_c,
    required this.maxtemp_f,
    required this.mintemp_c,
    required this.mintemp_f,
    required this.avgtemp_c,
    required this.avgtemp_f,
    required this.maxwind_mph,
    required this.maxwind_kph,
    required this.totalprecip_mm,
    required this.totalprecip_in,
    required this.avgvis_km,
    required this.avgvis_miles,
    required this.avghumidity,
    required this.daily_will_it_rain,
    required this.daily_chance_of_rain,
    required this.daily_will_it_snow,
    required this.daily_chance_of_snow,
    required this.condition,
    required this.uv,
  });

  factory Day.fromJson(Map<String, dynamic> json) {
    return Day(
      maxtemp_c: (json['maxtemp_c'] as num).toDouble(),
      maxtemp_f: (json['maxtemp_f'] as num).toDouble(),
      mintemp_c: (json['mintemp_c'] as num).toDouble(),
      mintemp_f: (json['mintemp_f'] as num).toDouble(),
      avgtemp_c: (json['avgtemp_c'] as num).toDouble(),
      avgtemp_f: (json['avgtemp_f'] as num).toDouble(),
      maxwind_mph: (json['maxwind_mph'] as num).toDouble(),
      maxwind_kph: (json['maxwind_kph'] as num).toDouble(),
      totalprecip_mm: (json['totalprecip_mm'] as num).toDouble(),
      totalprecip_in: (json['totalprecip_in'] as num).toDouble(),
      avgvis_km: (json['avgvis_km'] as num).toDouble(),
      avgvis_miles: (json['avgvis_miles'] as num).toDouble(),
      avghumidity: json['avghumidity'],
      daily_will_it_rain: json['daily_will_it_rain'],
      daily_chance_of_rain: json['daily_chance_of_rain'],
      daily_will_it_snow: json['daily_will_it_snow'],
      daily_chance_of_snow: json['daily_chance_of_snow'],
      condition: Condition.fromJson(json['condition']),
      uv: (json['uv'] as num).toDouble(),
    );
  }
}

class Astro {
  final String sunrise;
  final String sunset;
  final String moonrise;
  final String moonset;
  final String moon_phase;
  final int moon_illumination;
  final int is_moon_up;
  final int is_sun_up;

  const Astro({
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moon_phase,
    required this.moon_illumination,
    required this.is_moon_up,
    required this.is_sun_up,
  });

  factory Astro.fromJson(Map<String, dynamic> json) {
    return Astro(
      sunrise: json['sunrise'],
      sunset: json['sunset'],
      moonrise: json['moonrise'],
      moonset: json['moonset'],
      moon_phase: json['moon_phase'],
      moon_illumination: json['moon_illumination'],
      is_moon_up: json['is_moon_up'],
      is_sun_up: json['is_sun_up'],
    );
  }
}

class Hour {
  final int time_epoch;
  final String time;
  final double temp_c;
  final double temp_f;
  final int is_day;
  final Condition condition;
  final double wind_mph;
  final double wind_kph;
  final int wind_degree;
  final String wind_dir;
  final double pressure_mb;
  final double pressure_in;
  final double precip_mm;
  final double precip_in;
  final int humidity;
  final int cloud;
  final double feelslike_c;
  final double feelslike_f;
  final double windchill_c;
  final double windchill_f;
  final double heatindex_c;
  final double heatindex_f;
  final double dewpoint_c;
  final double dewpoint_f;
  final int will_it_rain;
  final int chance_of_rain;
  final int will_it_snow;
  final int chance_of_snow;
  final double vis_km;
  final double vis_miles;
  final double gust_mph;
  final double gust_kph;
  final double uv;

  const Hour({
    required this.time_epoch,
    required this.time,
    required this.temp_c,
    required this.temp_f,
    required this.is_day,
    required this.condition,
    required this.wind_mph,
    required this.wind_kph,
    required this.wind_degree,
    required this.wind_dir,
    required this.pressure_mb,
    required this.pressure_in,
    required this.precip_mm,
    required this.precip_in,
    required this.humidity,
    required this.cloud,
    required this.feelslike_c,
    required this.feelslike_f,
    required this.windchill_c,
    required this.windchill_f,
    required this.heatindex_c,
    required this.heatindex_f,
    required this.dewpoint_c,
    required this.dewpoint_f,
    required this.will_it_rain,
    required this.chance_of_rain,
    required this.will_it_snow,
    required this.chance_of_snow,
    required this.vis_km,
    required this.vis_miles,
    required this.gust_mph,
    required this.gust_kph,
    required this.uv,
  });

  factory Hour.fromJson(Map<String, dynamic> json) {
    return Hour(
      time_epoch: json['time_epoch'],
      time: json['time'],
      temp_c: (json['temp_c'] as num).toDouble(),
      temp_f: (json['temp_f'] as num).toDouble(),
      is_day: json['is_day'],
      condition: Condition.fromJson(json['condition']),
      wind_mph: (json['wind_mph'] as num).toDouble(),
      wind_kph: (json['wind_kph'] as num).toDouble(),
      wind_degree: json['wind_degree'],
      wind_dir: json['wind_dir'],
      pressure_mb: (json['pressure_mb'] as num).toDouble(),
      pressure_in: (json['pressure_in'] as num).toDouble(),
      precip_mm: (json['precip_mm'] as num).toDouble(),
      precip_in: (json['precip_in'] as num).toDouble(),
      humidity: json['humidity'],
      cloud: json['cloud'],
      feelslike_c: (json['feelslike_c'] as num).toDouble(),
      feelslike_f: (json['feelslike_f'] as num).toDouble(),
      windchill_c: (json['windchill_c'] as num).toDouble(),
      windchill_f: (json['windchill_f'] as num).toDouble(),
      heatindex_c: (json['heatindex_c'] as num).toDouble(),
      heatindex_f: (json['heatindex_f'] as num).toDouble(),
      dewpoint_c: (json['dewpoint_c'] as num).toDouble(),
      dewpoint_f: (json['dewpoint_f'] as num).toDouble(),
      will_it_rain: json['will_it_rain'],
      chance_of_rain: json['chance_of_rain'],
      will_it_snow: json['will_it_snow'],
      chance_of_snow: json['chance_of_snow'],
      vis_km: (json['vis_km'] as num).toDouble(),
      vis_miles: (json['vis_miles'] as num).toDouble(),
      gust_mph: (json['gust_mph'] as num).toDouble(),
      gust_kph: (json['gust_kph'] as num).toDouble(),
      uv: (json['uv'] as num).toDouble(),
    );
  }
}
