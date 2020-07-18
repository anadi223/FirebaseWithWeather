import 'dart:convert';

import 'package:http/http.dart';
import 'package:signinwithfire/model/weatherforecast_model.dart';
import 'package:signinwithfire/util/weather_util.dart';

class Network{

  Future<WeatherForecastModel> getWeatherForecast({String city}) async{
    var finalurl = "http://api.openweathermap.org/data/2.5/forecast?q="+city+"&appid="+Util.appId+"&units=metric";

    final response = await get(Uri.encodeFull(finalurl));
    if(response.statusCode==200){
      print(response.body);
      return WeatherForecastModel.fromJson(jsonDecode(response.body));
    }else {
      throw Exception("ERROR GETTING WEATHER FROM THE DATA");
    }
  }

}