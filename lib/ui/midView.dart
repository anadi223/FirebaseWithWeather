import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:signinwithfire/model/weatherforecast_model.dart';
import 'package:signinwithfire/util/convert_icons.dart';


const Color kcolor = Color(0xffb00020);
//0xff934B79
const kIconTextStyle = TextStyle(fontSize: 16.0,fontWeight: FontWeight.w500,color: Colors.black87);

Widget midView(AsyncSnapshot<WeatherForecastModel> snapshot) {
  var forecastList = snapshot.data.list;
  var city = snapshot.data.city.name;
  var country = snapshot.data.city.country;
  var date = forecastList[0].dtTxt;
  var dateFormatted = date.split(" ");
  Container midView = Container(
    child: Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "$city, $country",
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
          ),
          Text(
            "${dateFormatted[0]}",
            style: TextStyle(fontSize: 16.0, color: Colors.grey[700]),
          ),
          SizedBox(
            height: 10.0,
          ),
          getWeatherIcon(weatherDescription: forecastList[0].weather[0].main,color: Color(0xff934B79),size: 170),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "${forecastList[0].main.temp.toInt()}°C",
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  "${forecastList[0].weather[0].description.toUpperCase()}",
                  style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(vertical:12.0,horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text("${forecastList[0].wind.speed} km/h",style: kIconTextStyle,),
                    Icon(FontAwesomeIcons.wind,color: kcolor,),
                  ],
                ),
                SizedBox(width: 8.0,),
                Column(
                  children: <Widget>[
                    Text("${forecastList[0].main.humidity} %",style: kIconTextStyle,),
                    Icon(FontAwesomeIcons.grinBeamSweat,color: kcolor,),
                  ],
                ),
                SizedBox(width: 8.0,),
                Column(
                  children: <Widget>[
                    Text("${forecastList[0].main.tempMax}°C",style: kIconTextStyle,),
                    Icon(FontAwesomeIcons.temperatureHigh,color: kcolor,),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
  return midView;
}
