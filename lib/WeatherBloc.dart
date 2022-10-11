import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_weather_bloc/WeatherModel.dart';
import 'package:flutter_weather_bloc/WeatherRepo.dart';

class WeatherEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object> get props => [];

}

class FetchWeatherEvent extends WeatherEvent{

  final _city;
  FetchWeatherEvent(this._city);

  @override
  // Equatable class needs to override props method
  List<Object> get props => [_city];

}

class ResetWeather extends WeatherEvent{

}

class WeatherState extends Equatable{
  @override
  // TODO: implement props
  List<Object> get props => [];

}

class WeatherIsNotSearched extends WeatherState{

}

class WeatherIsLoading extends WeatherState{

}

class WeatherIsLoaded extends WeatherState{

  final _weather;
  WeatherIsLoaded(this._weather);
  WeatherModel get getWeather => _weather;

  @override
  // TODO: implement props
  List<Object> get props => [_weather];


}

class WeatherIsNotLoaded extends WeatherState{

}


class WeatherBloc extends Bloc<WeatherEvent, WeatherState>{

  WeatherRepo weatherRepo;

  WeatherBloc(this.weatherRepo);

  @override
  // TODO: implement initialState
  WeatherState get initialState => WeatherIsNotSearched();

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {

    if(event is FetchWeatherEvent){
      yield WeatherIsLoading();

    try{
      WeatherModel weather = await WeatherRepo().getWeatherData(event._city);
      print(weather);
      yield WeatherIsLoaded(weather);
    }

    catch(_){
      WeatherIsNotLoaded();
    }
  } else if(event is ResetWeather){
      yield WeatherIsNotSearched();
    }


  }
}