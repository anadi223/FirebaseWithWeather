///This is used to get the weather icon and to change it according to the description

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget getWeatherIcon({String weatherDescription,Color color,double size}){
  switch(weatherDescription){
    case "Clouds":{return Icon(FontAwesomeIcons.cloud,color: color,size: size,);}break;
    case "Sun":{return Icon(FontAwesomeIcons.sun,color: color,size: size,);}break;
    case "Rain":{return Icon(FontAwesomeIcons.cloudRain,color: color,size: size,);}break;
    case "Snow":{return Icon(FontAwesomeIcons.snowman,color: color,size: size,);}break;
    default: {return Icon(FontAwesomeIcons.sun,color: color,size: size,);}break;
  }
}