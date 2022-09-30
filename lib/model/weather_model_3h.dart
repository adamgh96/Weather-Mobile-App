// ignore_for_file: deprecated_member_use

class Weather3h {
  String? cityName;

  List<String?> time = <String?>[];

  List<double?> temp = <double?>[];
  List<double?> temp_min = <double?>[];
  List<double?> temp_max = <double?>[];
  List<double?> wind = <double?>[];
  List<int?> humidity = <int?>[];

  Weather3h({this.cityName});

  Weather3h.fromJson(Map<String, dynamic> json) {
    cityName = json["city"]["name"];
    for (var i = 0; i < 9; i++) {
      temp.add(json["list"][i]["main"]["temp"]);
    }
    for (var i = 0; i < 9; i++) {
      time.add(json["list"][i]["dt_txt"]);
    }
    for (var i = 0; i < 9; i++) {
      temp_min.add(json["list"][i]["main"]["temp_min"]);
    }
    for (var i = 0; i < 9; i++) {
      temp_max.add(json["list"][i]["main"]["temp_max"]);
    }
    for (var i = 0; i < 9; i++) {
      wind.add(json["list"][i]["wind"]["speed"]);
    }
    for (var i = 0; i < 9; i++) {
      humidity.add(json["list"][i]["main"]["humidity"]);
    }
  }
}
