
class WeatherModel{
  final temp;
  final pressure;
  final humidity;
  final tempMax;
  final tempMin;


  double get getTemp => temp-272.5;
  double get getMaxTemp => tempMax-272.5;
  double get getMinTemp=> tempMin -272.5;

  WeatherModel({this.temp, this.pressure, this.humidity, this.tempMax, this.tempMin});


  factory WeatherModel.fromJson(Map<String, dynamic> json){
    return WeatherModel(
        temp:json['temp'],
        pressure:json['pressure'],
        humidity:json['humidity'],
        tempMax:json['temp_max'],
        tempMin:json['temp_min'],
    );
  }

  }