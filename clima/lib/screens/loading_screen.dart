import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima/Location.dart';
import 'package:http/http.dart';
import 'dart:convert';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }

  void getLocation() async {
    print('pressed');
    Location location = Location();
    location.getCurrentLocation();
    //print(position);
    getData();
  }

  void getData() async {
    double longitude;
    double latitude;
    Location location = Location();
    latitude = location.getLatitude();
    longitude = location.getLongitude();

    Response response = await get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?lat=30.0444&lon=31.2357&appid=970b044b235762e719343872e7839150'));

    if (response.statusCode == 200) {
      String data = response.body;
      var long = jsonDecode(data)['city']['coord']['lon'];
      var name = jsonDecode(data)['city']['name'];
      print(long);
      print(name);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    String myMargin = '15';
    try {
      double myMarginAsADouble = double.parse(myMargin);
      return Scaffold(
        body: Container(
          margin: EdgeInsets.all(double.parse(myMargin)),
          color: Colors.red,
        ),
      );
    } catch (e) {
      print(e);
      return Scaffold(
        body: Container(
          margin: EdgeInsets.all(30),
          color: Colors.black,
        ),
      );
    }
  }
}
