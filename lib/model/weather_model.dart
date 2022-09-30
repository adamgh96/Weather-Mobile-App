class Weather {
  String? cityName;
  double? temp;
  double? temp_min;
  double? temp_max;
  double? wind;
  int? humidity;
  double? feel_like;
  int? pressure;
  String? description;
  int? sunrise;
  int? sunset;

  Weather(
      {this.cityName,
      this.temp,
      this.wind,
      this.humidity,
      this.feel_like,
      this.pressure,
      this.description,
      this.temp_min,
      this.temp_max,
      this.sunrise,
      this.sunset});

  Weather.fromJson(Map<String, dynamic> json) {
    cityName = json["name"];
    temp = json["main"]["temp"];
    wind = json["wind"]["speed"];
    pressure = json["wind"]["pressure"];
    humidity = json["main"]["humidity"];
    feel_like = json["main"]["feels_like"];
    temp_min = json["main"]["temp_min"];
    temp_max = json["main"]["temp_max"];
    description = json["weather"][0]["description"];
    sunrise = json["sys"]["sunrise"];
    sunset = json["sys"]["sunset"];
  }
}
