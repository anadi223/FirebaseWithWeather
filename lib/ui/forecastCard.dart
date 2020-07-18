import 'package:flutter/material.dart';
import 'package:signinwithfire/model/weatherforecast_model.dart';
import 'package:signinwithfire/util/convert_icons.dart';


Widget foreCastCard(AsyncSnapshot<WeatherForecastModel> snapshot,int index){
  var forecast = snapshot.data.list;
  var dateWithHour = forecast[index].dtTxt;
  var dateFormatted = dateWithHour.split(" ");
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Center(child: Text(dateFormatted[0],style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),),
Center(child: Text("${dateFormatted[1]} hrs",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),),
//      Center(child: Text("$dateWithHour hrs",)),
      SizedBox(height: 8.0,),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          getWeatherIcon(weatherDescription: forecast[index].weather[0].main,color: Color(0xff934B79),size: 50),
          Column(
            children: <Widget>[
              Text("Max Temp:${forecast[index].main.tempMax}°C"),
              SizedBox(height: 6.0,),
              Text("Hum: ${forecast[index].main.humidity}%"),
              SizedBox(height: 6.0,),
              Text("Wind:${forecast[index].wind.speed}km/h"),
            ],
          )
        ],
      )
    ],
  );
}