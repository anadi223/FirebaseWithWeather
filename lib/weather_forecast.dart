import 'package:flutter/material.dart';
import 'package:signinwithfire/model/weatherforecast_model.dart';
import 'package:signinwithfire/ui/bottomView.dart';
import 'package:signinwithfire/ui/midView.dart';


import 'network/weather_network.dart';


class WeatherForecast extends StatefulWidget {
  @override
  _WeatherForecastState createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  Future<WeatherForecastModel> forecastObject;
  String _city = "Mumbai";
  @override
  void initState() {
    super.initState();
    forecastObject = Network().getWeatherForecast(city: _city);
//    forecastObject.then((weather) => print(weather.list[0].weather[0].main));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Padding(
              padding:  EdgeInsets.only(top:8.0),
              child: textFieldView(),
            ),
            Container(
              child: FutureBuilder<WeatherForecastModel>(
                future: forecastObject,
                builder: (BuildContext context, AsyncSnapshot<WeatherForecastModel> snapshot){
                  if(snapshot.hasData){
                    return Column(
                      children: <Widget>[
                        midView(snapshot),
                        bottomView(snapshot,context,),
                      ],
                    );
                  }else {
                    return Center(child: CircularProgressIndicator(),);
                  }
              }
              )
            )
          ],
        ),
      ),
    );
  }

 Widget textFieldView() {
    return Container(
      child: TextField(
        decoration: InputDecoration(
          hintText: "Enter the city name",
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          contentPadding: EdgeInsets.all(8.0),
        ),
        onSubmitted: (value){
          setState(() {
            _city = value;
            forecastObject = new Network().getWeatherForecast(city: _city);
          });
        },
      ),
    );
 }
}

