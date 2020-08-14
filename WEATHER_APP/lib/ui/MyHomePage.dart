import 'dart:async';

import 'package:flutter/material.dart';
import 'package:WEATHER_APP/ui/Weather.dart';
import 'package:WEATHER_APP/api/MapApi.dart';
import 'package:WEATHER_APP/model/WeatherData.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/services.dart';

var geolocator = Geolocator();
var locationOptions =
    LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 10);

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  WeatherData _weatherData;

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.yellowAccent[100],
      appBar: new AppBar(
        backgroundColor: Colors.red,
        title: new Text(widget.title),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 35),
            child: Image(
              alignment: Alignment.topCenter,
              image: AssetImage("assets/images/image2.png"),
              fit: BoxFit.cover,
              width: 350,
            ),
          ),
          _weatherData != null
              ? Container(
                  child: Weather(
                    weatherData: _weatherData,
                  ),
                  height: 320,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(
                    top: 195,
                    left: 20,
                    right: 20,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 5,
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(45),
                    image: DecorationImage(
                      image: AssetImage("assets/images/image7.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : Center(
                  child: Container(
                    child: CircularProgressIndicator(
                      strokeWidth: 4.0,
                      valueColor: AlwaysStoppedAnimation(Colors.white),
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  getCurrentLocation() async {
    StreamSubscription<Position> positionStream = geolocator
        .getPositionStream(locationOptions)
        .listen((Position position) {
      print(position == null
          ? 'Unknown'
          : position.latitude.toString() +
              ', ' +
              position.longitude.toString());
      loadWeather(lat: position.latitude, lon: position.longitude);
    });
  }

  loadWeather({double lat, double lon}) async {
    MapApi mapApi = MapApi.getInstance();
    final data = await mapApi.getWeather(lat: lat, lon: lon);
    setState(() {
      this._weatherData = data;
    });
  }
}
