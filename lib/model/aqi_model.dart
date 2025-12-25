class AqiResponse {
  final String status;
  final AqiData data;


  AqiResponse({
    required this.status,
    required this.data,
  });


  factory AqiResponse.fromJson(Map<String, dynamic> json) {
    return AqiResponse(
      status: json['status'],
      data: AqiData.fromJson(json['data']),
    );
  }
}


class AqiData {
  final int aqi;
  final int idx;
  final List<Attribution> attributions;
  final City city;
  final String dominentpol;
  final IAqi iaqi;
  final AqiTime time;
  final Forecast forecast;


  AqiData({
    required this.aqi,
    required this.idx,
    required this.attributions,
    required this.city,
    required this.dominentpol,
    required this.iaqi,
    required this.time,
    required this.forecast,
  });


  factory AqiData.fromJson(Map<String, dynamic> json) {
    return AqiData(
      aqi: json['aqi'],
      idx: json['idx'],
      attributions: (json['attributions'] as List)
          .map((e) => Attribution.fromJson(e))
          .toList(),
      city: City.fromJson(json['city']),
      dominentpol: json['dominentpol'],
      iaqi: IAqi.fromJson(json['iaqi']),
      time: AqiTime.fromJson(json['time']),
      forecast: Forecast.fromJson(json['forecast']),
    );
  }
}


class Attribution {
  final String name;
  final String url;
  final String? logo;


  Attribution({
    required this.name,
    required this.url,
    this.logo,
  });


  factory Attribution.fromJson(Map<String, dynamic> json) {
    return Attribution(
      name: json['name'],
      url: json['url'],
      logo: json['logo'],
    );
  }
}


class City {
  final List<double> geo;
  final String name;
  final String url;
  final String location;


  City({
    required this.geo,
    required this.name,
    required this.url,
    required this.location,
  });


  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      geo: List<double>.from(json['geo']),
      name: json['name'],
      url: json['url'],
      location: json['location'],
    );
  }
}


class IAqi {
  final AqiValue? pm25;
  final AqiValue? pm10;
  final AqiValue? o3;
  final AqiValue? no2;
  final AqiValue? so2;
  final AqiValue? co;
  final AqiValue? t;
  final AqiValue? h;
  final AqiValue? p;
  final AqiValue? w;
  final AqiValue? wd;
  final AqiValue? dew;


  IAqi({
    this.pm25,
    this.pm10,
    this.o3,
    this.no2,
    this.so2,
    this.co,
    this.t,
    this.h,
    this.p,
    this.w,
    this.wd,
    this.dew,
  });


  factory IAqi.fromJson(Map<String, dynamic> json) {
    AqiValue? parse(String key) =>
        json[key] != null ? AqiValue.fromJson(json[key]) : null;


    return IAqi(
      pm25: parse('pm25'),
      pm10: parse('pm10'),
      o3: parse('o3'),
      no2: parse('no2'),
      so2: parse('so2'),
      co: parse('co'),
      t: parse('t'),
      h: parse('h'),
      p: parse('p'),
      w: parse('w'),
      wd: parse('wd'),
      dew: parse('dew'),
    );
  }
}


class AqiValue {
  final double v;


  AqiValue({required this.v});


  factory AqiValue.fromJson(Map<String, dynamic> json) {
    return AqiValue(
      v: (json['v'] as num).toDouble(),
    );
  }
}


class AqiTime {
  final String s;
  final String tz;
  final int v;
  final String iso;


  AqiTime({
    required this.s,
    required this.tz,
    required this.v,
    required this.iso,
  });


  factory AqiTime.fromJson(Map<String, dynamic> json) {
    return AqiTime(
      s: json['s'],
      tz: json['tz'],
      v: json['v'],
      iso: json['iso'],
    );
  }
}


class Forecast {
  final DailyForecast daily;


  Forecast({required this.daily});


  factory Forecast.fromJson(Map<String, dynamic> json) {
    return Forecast(
      daily: DailyForecast.fromJson(json['daily']),
    );
  }
}


class DailyForecast {
  final List<ForecastItem> pm10;
  final List<ForecastItem> pm25;
  final List<ForecastItem> uvi;


  DailyForecast({
    required this.pm10,
    required this.pm25,
    required this.uvi,
  });


  factory DailyForecast.fromJson(Map<String, dynamic> json) {
    List<ForecastItem> parseList(String key) =>
        (json[key] as List)
            .map((e) => ForecastItem.fromJson(e))
            .toList();


    return DailyForecast(
      pm10: parseList('pm10'),
      pm25: parseList('pm25'),
      uvi: parseList('uvi'),
    );
  }
}


class ForecastItem {
  final int avg;
  final int min;
  final int max;
  final String day;


  ForecastItem({
    required this.avg,
    required this.min,
    required this.max,
    required this.day,
  });


  factory ForecastItem.fromJson(Map<String, dynamic> json) {
    return ForecastItem(
      avg: json['avg'],
      min: json['min'],
      max: json['max'],
      day: json['day'],
    );
  }
}



