import 'package:flutter/material.dart';
import 'package:signinwithfire/model/weatherforecast_model.dart';
import 'forecastCard.dart';

Widget bottomView(
  AsyncSnapshot<WeatherForecastModel> snapshot,
  BuildContext context,
) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Text(
        "5 day / 3 hour forecast data",
        style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, shadows: [
          Shadow(color: Colors.grey, blurRadius: 6.0, offset: Offset(1.0, 1.0))
        ]),
      ),
      Container(
        height: 200,
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => SizedBox(
                  width: 10.0,
                ),
            itemCount: snapshot.data.list.length,
            itemBuilder: (context, index) => Container(
                  height: 180,
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(2.0, 2.0),
                            spreadRadius: 0.0,
                            blurRadius: 8.0),
                      ],
                      borderRadius: BorderRadius.circular(15.0),
                      gradient: LinearGradient(colors: [
                        Color(0xffD3CCE3),
                        Color(0xffE9E4F0),
                      ], begin: Alignment.topLeft, end: Alignment.topRight)),
                  child: foreCastCard(snapshot, index),
                )),
      )
    ],
  );
}
